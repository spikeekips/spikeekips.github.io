# -*- coding: utf-8 -*-
import datetime
import urllib
import copy
import os
import json
import shutil
import subprocess
import glob
import re


def nbconvert (f, ) :
    return subprocess.call((
            'ipython',
            'nbconvert',
            '--template',
            'ipython/spikeekips.tpl',
            f,
        ), )


RE_MARKDOWN_TAGS = re.compile('[\s]*#[\s]*(.*)', re.U | re.M, )
INDEX_JSON_FILE = '.index.json'

CELL = dict(
        cell_type='markdown',
        metadata=dict(),
        source=list(),
    )


# read .index.json
if not os.path.exists(INDEX_JSON_FILE, ) :
    _index = list()
else :
    _index = json.loads(file(INDEX_JSON_FILE, ).read(), )


_already_built = dict()
for _date_written, _title, _target in _index :
    _already_built[_target] = (_date_written, _title, )


for i in glob.glob('notebook/*.ipynb') :
    _parsed = json.loads(file(i, ).read(), )
    _output = '%s.html' % os.path.splitext(os.path.basename(i, ), )[0]
    _target = os.path.join('post', _output, )

    # title
    _title = None
    _date_written = datetime.datetime.fromtimestamp(os.path.getmtime(i, ), ).isoformat()
    for j in _parsed.get('worksheets')[0].get('cells') :
        if j.get('cell_type') not in ('markdown', 'heading', ) :
            continue

        if _title is None :
            _title = ' '.join(j.get('source'), )
            break

    nbconvert(i, )

    with file(_target, 'wb', )  as f :
        import BeautifulSoup
        _bf = BeautifulSoup.BeautifulSoup(file(_output, ).read(), )

        _b = _bf.find('div', {'class': 'g-comments', }, )
        _b['data-href'] = urllib.basejoin('http://spikeekips.github.io/', _target, )
        f.write(str(_bf, ), )

    if _target not in _already_built :
        _index.append((_date_written, RE_MARKDOWN_TAGS.findall(_title, )[0], _target, ), )

    os.remove(_output, )


################################################################################
# create index.html
_index.sort()
_index.reverse()


# store .index.json
with file(INDEX_JSON_FILE, 'wb', ) as f :
    json.dump(_index, f, )


# write index.html
_index_data = dict(
        metadata=dict(),
        nbformat=3,
        nbformat_minor=0,
        worksheets=(dict(
               cells=list(),
            ), ),
    )

for _date_written, _title, _target in _index :
    _cell = copy.deepcopy(CELL, )
    _cell['source'].append(
            u'ㅎ. %s: &nbsp; [%s](%s)' % (_date_written, _title, _target, ),
        )
    _index_data['worksheets'][0]['cells'].append(_cell, )


import pprint
pprint.pprint(_index_data, )
with file('/tmp/index.json', 'wb', ) as f :
    json.dump(_index_data, f, )


nbconvert('/tmp/index.json', )
################################################################################


