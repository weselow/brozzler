import os
import subprocess

os.chdir(os.path.dirname(os.path.abspath(__file__)))

def extract_warc_files():
    for file in os.listdir('.'):
        if not file.endswith('warc.gz'):
            continue

        output_dir = file.replace('.warc.gz', '')
 
        if not os.path.isdir(output_dir):
            os.mkdir(output_dir)

        filepath = os.path.dirname( os.path.abspath(__file__))

        filepath = os.path.join(filepath, file)

        command = [
            'python3',
            '-m' 'warcat',
            'extract',
            '{file}'.format(file=filepath),
            '--output-dir',
            '{output_dir}'.format(output_dir=output_dir),
            '--progress'
        ]

        extract_warc = subprocess.Popen(command)
        extract_warc.wait()


if __name__ == '__main__':
    extract_warc_files()
