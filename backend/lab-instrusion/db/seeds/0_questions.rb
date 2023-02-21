question_param = {
  answer: 1234,
  difficulty: 1,
  nickname: 'test'
}

question = Question.find_or_initialize_by(id: 1)
question.update!(question_param)

paints_params = [
  {
    id: 1,
    question_id: question.id,
    target: '1',
    painted_count: 75
  },
  {
    id: 2,
    question_id: question.id,
    target: '2',
    painted_count: 75
  },
  {
    id: 3,
    question_id: question.id,
    target: '3',
    painted_count: 75
  },
  {
    id: 4,
    question_id: question.id,
    target: '4',
    painted_count: 75
  },
  {
    id: 5,
    question_id: question.id,
    target: '5',
    painted_count: 25
  },
  {
    id: 6,
    question_id: question.id,
    target: '6',
    painted_count: 25
  },
  {
    id: 7,
    question_id: question.id,
    target: '7',
    painted_count: 25
  },
  {
    id: 8,
    question_id: question.id,
    target: '8',
    painted_count: 25
  },
  {
    id: 9,
    question_id: question.id,
    target: '9',
    painted_count: 25
  }
]

for param in paints_params do
  paint = Paint.find_or_initialize_by(id: param[:id])
  paint.update!(param)
end
