"use client"
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

const pods = [
  {
    name: "Podcast 1",
    host: "Host 1",
    description: "Description 1",
  },
  {
    name: "Podcast 2",
    host: "Host 2",
    description: "Description 2",
  },
  {
    name: "Podcast 3",
    host: "Host 3",
    description: "Description 3",
  },
];

export function PodList() {
  return (
    <Table>
      <TableCaption>Tomer Hamelech</TableCaption>
      <TableHeader>
        <TableRow>
          <TableHead className="w-[100px]">Invoice</TableHead>
          <TableHead>Status</TableHead>
          <TableHead>Method</TableHead>
          <TableHead className="text-right">Amount</TableHead>
        </TableRow>
      </TableHeader>
      <TableBody>
        {pods.map((pod) => (
          <TableRow key={pod.name}>
            <TableCell className="font-medium">{pod.description}</TableCell>
          </TableRow>
        ))}
      </TableBody>
      <TableFooter>
        <TableRow>
          <TableCell colSpan={3}>Total</TableCell>
          <TableCell className="text-right">$2,500.00</TableCell>
        </TableRow>
      </TableFooter>
    </Table>
  );
}
