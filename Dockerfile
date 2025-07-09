# Python 3.10 기반 이미지 사용
FROM python:3.10-slim

# 작업 디렉토리 생성
WORKDIR /app

# 의존성 파일 복사 후 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 소스 코드 복사
COPY . .

# 포트 오픈 (FastAPI 기본 8000)
EXPOSE 8000

# FastAPI 앱 실행 (main.py 내 app 객체 실행)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
