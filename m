Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4E38A1A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471A889DB4;
	Fri,  7 Jun 2019 12:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CCE89DB4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:23:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607122314euoutp0219a7a569cbb2cf59fbcb6dcbd0aaa1cc~l6g6q8jiH2939929399euoutp029
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:23:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190607122314euoutp0219a7a569cbb2cf59fbcb6dcbd0aaa1cc~l6g6q8jiH2939929399euoutp029
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607122314eucas1p2151e2a94f7d425b1207c6c87fb503441~l6g6V69CI3165931659eucas1p2y;
 Fri,  7 Jun 2019 12:23:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C4.84.04298.1375AFC5; Fri,  7
 Jun 2019 13:23:13 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607122313eucas1p221888f45771149f9ea67dbbacbea81f9~l6g5Jp9XS0604406044eucas1p2K;
 Fri,  7 Jun 2019 12:23:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607122312eusmtrp2d7bde8707d398f5235cfd42bbac0869d~l6g46GUOP0428004280eusmtrp2E;
 Fri,  7 Jun 2019 12:23:12 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-20-5cfa57319bf8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C3.C1.04140.0375AFC5; Fri,  7
 Jun 2019 13:23:12 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607122312eusmtip117a067948ef952a766d1ac9f676a9076~l6g4n4nFd1730017300eusmtip1B;
 Fri,  7 Jun 2019 12:23:12 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: atafb: remove superfluous function
 prototypes
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <b1b4d156-ca2a-2c2f-fce1-097a1eb270dc@samsung.com>
Date: Fri, 7 Jun 2019 14:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVbFaY583xJMd9kkW=-dQDY_yPAeToQT854kWFvokECLw@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduzneV3D8F8xBuc+G1pc+fqezeLZrb1M
 Fif6PrBaXN41h82BxePQ4Q5Gj/vdx5k8Pm+SC2CO4rJJSc3JLEst0rdL4MrY/8G54A1zxe9p
 Z5gbGOcydzFyckgImEgc+LyRHcQWEljBKHG9y7yLkQvI/sIo8XnCD1YI5zOjxPwPH4A6OMA6
 Tq7xgYgvZ5R49P40G4TzllHiwcF/YGOFBYIkDu+8ygrSICKgKzHnJxNIDbPAekaJN8+3soLU
 sAlYSUxsX8UIUsMrYCfx468USJhFQEVid3MvWImoQITE/WMbwGxeAUGJkzOfsIDYnAKBEtOv
 rQZbxSwgLnHryXwmCFteYvvbOcwguyQE+tklvj4+BvWmi8TGFxuhbGGJV8e3sEPYMhL/d85n
 gmhYxyjxt+MFVPd2Ronlk/+xQVRZSxw+fhHsG2YBTYn1u/Qhwo4STU9ns0FChU/ixltBiCP4
 JCZtmw4NLF6JjjYhiGo1iQ3LNrDBrO3auZJ5AqPSLCSvzULyziwk78xC2LuAkWUVo3hqaXFu
 emqxYV5quV5xYm5xaV66XnJ+7iZGYDI5/e/4px2MXy8lHWIU4GBU4uH1YP8ZI8SaWFZcmXuI
 UYKDWUmEt+zCjxgh3pTEyqrUovz4otKc1OJDjNIcLErivNUMD6KFBNITS1KzU1MLUotgskwc
 nFINjBprOrmXLMySkVp9aveff48mL7hcdF5z79n1W4JjUhPzHul46C5T+TL/bdRNprhqsReM
 CY1zmoz+5T1d3czifc/3hPK8Cpvls1vYnv+Lqqjf33LqgYCTxjfjid0XXa5kLm/fdfLXsi1q
 eVPrb5ir8uqlH7j1XGF+i9Dl25tCD8fU6+teFP676rISS3FGoqEWc1FxIgCWiUk/IgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7oG4b9iDM5P0bK48vU9m8WzW3uZ
 LE70fWC1uLxrDpsDi8ehwx2MHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex/4NzwRvmit/TzjA3MM5l7mLk4JAQMJE4ucan
 i5GLQ0hgKaPEzcU7oOIyEsfXl3UxcgKZwhJ/rnWxQdS8ZpRYeaKFESQhLBAkcXjnVVaQehEB
 XYk5P5lAapgF1jNK9Fz5ygLRcJNR4s2JXUwgDWwCVhIT21cxgjTwCthJ/PgrBRJmEVCR2N3c
 ywpiiwpESJx5v4IFxOYVEJQ4OfMJmM0pECgx/dpqZhCbWUBd4s+8S1C2uMStJ/OZIGx5ie1v
 5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwerYd+7ll
 B2PXu+BDjAIcjEo8vDOYfsYIsSaWFVfmHmKU4GBWEuEtu/AjRog3JbGyKrUoP76oNCe1+BCj
 KdBzE5mlRJPzgZGdVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDUwoY
 RRG+UixdL4ovvoq22+NmzeqS4NO/cdbUeW6X43Q+h2V+ZZlj+4TR+q/LQ5ZL1o8v2j4oWm4v
 IvyJ2bXDqY3Jqtn12KTGi2F6/umPUiMeP9I5xvqZX+vP2d+vjR2OF3BwzWF8vPKnZoLjtDR/
 1tOz1Zl/agQzl/pU3JvVsoHvkmbkBxvOqGNKLMUZiYZazEXFiQAIMlRhtAIAAA==
X-CMS-MailID: 20190607122313eucas1p221888f45771149f9ea67dbbacbea81f9
X-Msg-Generator: CA
X-RootMTR: 20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c
References: <CGME20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c@eucas1p2.samsung.com>
 <50411fd1-9da0-aab6-709e-749d5e0ce509@samsung.com>
 <CAMuHMdVbFaY583xJMd9kkW=-dQDY_yPAeToQT854kWFvokECLw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910194;
 bh=ij0CHRSsbz3B1sP4qpNN4G9lp/PI1xazYBLkCGLAdn8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=V6osQn01huSZ2qFngDzh6FgCrVnnbGGBJPksKT10SZmsBfP4RtKSDNX4pL3JQPn76
 aE9B0pfS279bVWxLES1ATz2xztU8q1I9yqDHGn5IW2iuY1Y1syQmdf/jzsP74hu5d4
 n+07ph6cmBxvIBPXYjJ82rwWZkBZnJD6Kxzv7sxw=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA1LzIxLzE5IDQ6MTIgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBPbiBUdWUs
IE1heSAyMSwgMjAxOSBhdCA0OjAyIFBNIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKPiA8Yi56
b2xuaWVya2llQHNhbXN1bmcuY29tPiB3cm90ZToKPj4gTm8gbmVlZCBmb3IgdGhlbS4KPj4KPj4g
Q2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNv
bT4KPiAKPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4KVGhhbmtzLCBJIHF1ZXVlZCB0aGUgcGF0Y2ggZm9yIHY1LjMuCgpCZXN0IHJlZ2FyZHMs
Ci0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFu
ZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
