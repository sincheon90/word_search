# word_search
Portfolio를 위해 작성한 프로젝트입니다.

## 개요
Word Search는 무료 영영사전 API를 이용하여 단어의 뜻과 예문을 검색하는 앱입니다.
사용자가 검색한 결과는 Provider의 캐시에 저장하여, 화면에 표시합니다.

## 주요 기능
단어 검색 기능: API를 통해 검색한 단어의 뜻과 예문을 화면에 출력합니다.
검색 결과 캐싱: Provider 패키지의 캐싱 기능을 사용하여 검색 결과를 캐시에 저장하고, 저장된 결과를 화면에 표시합니다.
단어 리스트(구현중) : 검색한 단어를 리스트에 저장할 수 있습니다.

## 사용 기술
Flutter
Dio (HTTP 클라이언트)
Provider (상태 관리 패키지)
Json_annotation (JSON 직렬화 라이브러리)
Firestore (Firebase Realtime Database)