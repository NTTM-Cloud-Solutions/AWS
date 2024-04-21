import Image from "next/image";
import { PodList } from "./PodList";
import { BookList } from "./BookList";

export default function Home() {
  return (
    <>
    
    <div style={{ maxWidth: '1000px', margin: '0 auto' }}>
        <div style={{ position: 'relative', width: '100%', height: '200px', overflow: 'hidden' }}>
          <Image src="/hero.png" alt="Podify" layout="fill" objectFit="cover" />
        </div>
      </div>
        <BookList />
        <PodList />

    </>
  );
}
