Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113A783D23
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7663310E2EE;
	Tue, 22 Aug 2023 09:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 356 seconds by postgrey-1.36 at gabe;
 Mon, 21 Aug 2023 14:27:49 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543CF10E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:27:49 +0000 (UTC)
Received: from [192.168.1.155] ([95.114.20.39]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M42fG-1qY5mw3T6m-0002BN; Mon, 21 Aug 2023 16:21:50 +0200
Message-ID: <46e286cb-ca1a-4b5a-153f-0e0cade22bb9@metux.net>
Date: Mon, 21 Aug 2023 16:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: using gpu's to accelerate the linux kernel
Content-Language: tl
To: Raj J Putari <jmaharaj2013@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <CADXzsigVPkgkx4vmaKnhGuMdjt_3w0Fo3eFqDNSwyoH9JCrRQw@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
In-Reply-To: <CADXzsigVPkgkx4vmaKnhGuMdjt_3w0Fo3eFqDNSwyoH9JCrRQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dy7XZaNpxg/TFmWO/wN8tgcOojM+zEN9fu3AsMkrZiRRrNMVlzB
 Sd0q0AS0MiD/UO9QATzPtGNKdDZ7UU99W2zVaVWaUM4gNj2tg0tvrnVYqqo2lmXCRrpUdEf
 PgoNriPvgnGGbyZ3SFNA3ZL2LwhTeDsyxefhLtZkYat03flqsav24Ta8Q4FFi6tsZJwGztg
 6rMdeKWHK5PfIJGAyAaww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9S1HRCN5RI4=;c3MDSDirAHxMWJH+UecOJnOb/zr
 xbz2RZVmMV/IWokhc/Pjg17Z+Jh8e6MZCtqQd6T6vsK7Wj8X6Bs7i9YoGhFDWc+WJaMqR9Ip/
 ixqxw7pYPtap1s2o9dqqpP74XWgdeIa/Yr1ljdMuw4QqApMfZgcQtzRMIP+H6wNd7z2+/mVyc
 cT/M2P6xuPAy/EOuoGbRGPeFZnx2Jw/wuUfRyOP8SX6KEuUD+YvLzqc7/Ek9W3C8kI8ktFE+h
 aZ7+MDSX58X6y+OK7hdJ432z/UT04a4Tv+Lz0OsGXJcjETR/x3A2eijP6qkG/JvtYyeoxpBYF
 WgxX4qZixZXudyB0Pm9zraU8U1jpIdyD8BV9PC6zLAXHrn3M/bjCuMlI5Ec0L6YeHW90yY99p
 seZgXPdmo1+p+7+nLn0L28u61W//yOe/DEeq7QIxF1lK0Qe7PAw77QwvJ2102G4hWySV7skjl
 XW8fZm7NugEY9fNh9gbk53H3HoDhUo5qP2L/uGRmQLctSyUjXmU9WiTq5by1E7hFbph5gPiht
 86otS5AoHyFa/zC0KaxZMIiunOVGxTHdZ7MS1pd2mCUUA09cRgL6ChxD3JtuysSx5liWQ+fmK
 MNMXIssNlgE1zy3gvnAi5O/gN/v9utDpvyPHMc1spepd9jCGw+VaXDKf5rPujucGPb7Ta093s
 Om6BLB4pbUJ2zfks/oButB/H/AvjkMRulaX9HB0McgYMeIFRrqsNEjx0PqrHYrA8oTXj7eOlc
 H9ASFExrciW3mEoU/uuZeYz71ZtHrJTcwfdUuFgdGd35zRGUtlbgImBL+J0pfn/8VJaKzEKfT
 cBJoiZyhpC9xdV4N9T2WXmdaEbqRzbol9sGqzIVfYQhWPhbVa0Cf2/g4x6oyyZSxnFqinuUSO
 1iLI2CG6DStZEYQ==
X-Mailman-Approved-At: Tue, 22 Aug 2023 09:41:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.04.23 12:51, Raj J Putari wrote:

> id write it but im an amatuer and i dont have time to read the kernel
> source and experiment, we're talking about nvidia and amd video cards
> assisting in processing heavy data.

obviously not w/ NVidia (except for some old, already reverse-engineered
gpus), since Nvidia is doing all they can hiding the necessary specs
to write drivers from us.

Forget about Nvidia. Never ever waste a single penny on that.

> lets say youre compiling a kernel, you can write optimizations into
> the kernel through a cuda module and offload cpu data directly to the
> gpu using opencl or cuda or what amd supplies,

cuda, opencl, etc, are *userland* *library* APIs. They don't work inside
the kernel. One had to write something similar *inside* the kernel
(which is working very differently from userland). Also consider that
the most complex stuff (eg. creating command streams) is done in
userland (eg. mesa's pipe drivers, ...), the kernel is just responsible
for some more lowlevel things like buffer management, modesetting, etc.


If you wanna go that route, you'd have to create something like Mesa's
Gallium inside the kernel. Besides that this is a pretty huge task
(and you'd have to reimplement lots of drivers), you'd also have to
find a way to get a good performance when calling from userland (note
that syscalls, even ioctls, etc, are much more expensive than just
plain library function calls inside the same process). Probably comes
down to using some bytecode (tgsi ?) and loading it somewhat similar
to bpf.


Assuming that's really up and running one day, it indeed could solve
other problems, eg. clear separation between containers and hosts
(for now, containers still needs the userland parts of gpu drivers
for the corresponding host hardware).

But be warned: this is a huge endavour, *a lot* work to do and hard
to get it right.


OTOH, I'm yet sceptical whether there's much practical use cases for
using GPUs by the kernel *itself*. What exactly do you have in mind
here ?


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
