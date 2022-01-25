import { h } from 'preact';

export const ArticleFormTitle = () => (
  <div
    data-testid="title-help"
    className="crayons-article-form__help crayons-article-form__help--title"
  >
    <h4 className="mb-2 fs-l">Writing a Great Question Title</h4>
    <ul className="list-disc pl-6 color-base-70">
      <li>
        Think of your question title as a super short (but compelling!) description
        — like an overview of the actual question in one short sentence.
      </li>
      <li>
        Use keywords where appropriate to help ensure people can find your question
        by search.
      </li>
    </ul>
  </div>
);
