import { PodList } from "./PodList";
import { BookList } from "./BookList";

export default function Home() {
  return (
    <div style={{ display: "flex" }}>
      <div style={{ flex: 1 }}>
        <BookList />
      </div>
      <div style={{ flex: 3 }}>
        <PodList />
      </div>
    </div>
  );
}
