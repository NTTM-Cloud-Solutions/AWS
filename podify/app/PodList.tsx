import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"

const episodes = [
  {
    ep: "1",
    name: "Harry and the Philosopher's Stone",
    link: ">",
    date: "2022-01-01",
  },
  {
    ep: "2",
    name: "Hermonie and the Chamber of Secrets",
    link: ">",
    date: "2022-02-15",
  },
  {
    ep: "3",
    name: "Ron and the Prisoner of Azkaban",
    link: ">",
    date: "2022-03-30",
  },
  {
    ep: "4",
    name: "Griffindor and the Goblet of Fire",
    link: ">",
    date: "2022-04-10",
  },
  {
    ep: "5",
    name: "Hufflepuff and the Order of the Phoenix",
    link: ">",
    date: "2022-05-20",
  },
  {
    ep: "6",
    name: "Slytherin and the Half-Blood Prince",
    link: ">",
    date: "2022-06-05",
  },
  {
    ep: "7",
    name: "Ravenclaw and the Deathly Hallows",
    link: ">",
    date: "2022-07-15",
  },
]

export function PodList() {
  return (
    <Table>
      <TableHeader>
        <TableRow>
          <TableHead>Episode</TableHead>
          <TableHead>Name</TableHead>
          <TableHead>Date</TableHead>
          <TableHead className="text-right">Link</TableHead>
        </TableRow>
      </TableHeader>
      <TableBody>
        {episodes.map((episode) => (
          <TableRow key={episode.ep}>
            <TableCell className="font-medium">{episode.ep}</TableCell>
            <TableCell>{episode.name}</TableCell>
            <TableCell>{episode.date}</TableCell>
            <TableCell className="text-right">{episode.link}</TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  )
}
