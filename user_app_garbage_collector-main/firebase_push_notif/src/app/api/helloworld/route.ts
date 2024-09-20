
import initAdmin from '@/app/lib/firebase_notify/firebase_admin';
import { sendMessageFCM } from '@/app/lib/firebase_notify/firebase_messaging';
import type { NextApiRequest, NextApiResponse } from 'next'
 
type Data = {
  name: string
}
 
// export default function handler(
//   req: NextApiRequest,
//   res: NextApiResponse<Data>
// ) {
//   res.status(200).json({ name: 'John Doe' })
// }

export async function GET(
    req: NextApiRequest,
  ) {
    // console.log(req);
    await initAdmin();
    await sendMessageFCM();

    return Response.json({ message: 'Hello from Next.js!' })
  }