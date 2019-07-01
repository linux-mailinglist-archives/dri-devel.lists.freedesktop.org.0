Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8275BB79
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 14:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A602189C21;
	Mon,  1 Jul 2019 12:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B9B89C21
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 12:27:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190701122756euoutp0264d7bf74a2661b1761dc27c582a45cc5~tSD3goODK1867418674euoutp02A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 12:27:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190701122756euoutp0264d7bf74a2661b1761dc27c582a45cc5~tSD3goODK1867418674euoutp02A
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190701122755eucas1p156372a2c826bc0f7e86607f6e65ce63c~tSD22MBCl1727617276eucas1p1c;
 Mon,  1 Jul 2019 12:27:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 01.80.04325.B4CF91D5; Mon,  1
 Jul 2019 13:27:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190701122754eucas1p1d3dec4883761c4669591cd4a712dc539~tSD2BZGcb1707717077eucas1p1R;
 Mon,  1 Jul 2019 12:27:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190701122754eusmtrp1c37c4c15b12c2b0c6b3bb97ffd3e5dce~tSD1zHN_Y2350123501eusmtrp1M;
 Mon,  1 Jul 2019 12:27:54 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-07-5d19fc4b1623
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 42.64.04140.A4CF91D5; Mon,  1
 Jul 2019 13:27:54 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190701122753eusmtip107a13dc98816fd15e9c713a96ba8c60e~tSD1EUDm13120331203eusmtip1_;
 Mon,  1 Jul 2019 12:27:53 +0000 (GMT)
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345
 bridge on Teres-I
To: Maxime Ripard <maxime.ripard@bootlin.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <64471471-5b4d-3c1f-a0e3-e02ee78ca23c@samsung.com>
Date: Mon, 1 Jul 2019 14:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190701095842.fvganvycce2cy7jn@flea>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG+5/bjqPFcVa+WnRZERRollb/KKQrnagPXb6UIXasg0k6Y0ft
 Sq3MMMuyJGVLNyujqYPEy9KVraYpJU5NKy1tdiULTfIC62I5j4HffrzP87wvD7wsqTYzgWys
 NlHUaYU4DaOkbHUeV9CW3wGRIefapuEM11MCp9Z9Rviv7QqJzbUuGrcNfWfwcNszAqfcusvg
 cnsjjQduvCXw+SsFClz64SWNW+25DL79qoXA3T0OhFOraxW4q6QR4bLSayT22E0U9jibiDV+
 /C3PCMFbTVbEm6zH+U813xT8dX0LxZe8L6b56uF8iq8ydo3O0gw0X1p0nuH7XC4Ff2+4m+Yd
 eVYF775QT/BlBaf4+x16ZptvhHL1fjEuNlnULQ7fqzxgTPlFHvo048jw4yqkRw3T05EPC1wY
 PM94RKUjJavmLAgMxiKFV1BzgwgGCxbIwgCCdo+F+Z/4YX5NysIdBE32wvF4L4LirEuE1+XH
 RcBlR84YT+WCICM/i/aaSK6VhoHmL2MCwy2EP2UdY2tVXDh49HbSyxQ3H5rM3bSXp3G7oLXc
 jmSPLzw1fKS87MOFgsnxbmwPyYVA7c1cWubZcK83l5TZH15/NBPew8C1s/DC2q+QO2yAcnfL
 OPvB1/rycZ4JDVkXKZlPgdtylpTDaQgqSqpIWVgFNfUttMxr4We/c5TZUZ4C7b2+8uEpcNWW
 Q8pjFaSdU8vuueBurBjf4g+3m4eYTKQxTqhmnFDHOKGOcUKdfEQVIX8xSYqPEaVQrXg4WBLi
 pSRtTPC+hPhSNPq2DSP1Q5Xo4e9oJ+JYpJms0ndCpJoWkqWj8U4ELKmZqnJYAiLVqv3C0WOi
 LiFKlxQnSk40g6U0/qrjk7r3qLkYIVE8KIqHRN1/lWB9AvUoKt1Wq5qzr7hGFztnxBBRqQ1/
 ELZ1R8iznr7+2c1bMxICCoXd2WSPru7S+sG1fW98LSeWLis7vWuJ4a3R3RX8pDpw78qdrphH
 mSu/RJ30+5mXmb7ZdP2MNWy5LSg1O3TFNU/2u4vK6HzVuo60zk0plkHhw6yNycS8nEnvE6Sz
 i/9u/6yhpAPCkkWkThL+AUKHY5WyAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec9tR2l1nLdXI8whXWm2TfO10kqIDn4K6kNZYiMPKu0iO1t0
 +dBiZbbQlLJomluoJGa0VFJnMlpmqDgzU1FYXlKji7cuo5ldnCvw24/n+f8eeOBP46LHZCSd
 o9ZxWrVCKaYCia7fL93bUhcj0rdf+bwOFbg6MHS5fQqgP0+KcWRpc5HozfdZCnnedGLIWPGI
 Qg32bhJ9vfcWQ1eLKwWo7t0AifrsZRSqGuzF0OgHB0CXW9sEyG3rBqi+rgRHXns5gbzOHmxv
 MFvh/Y2xteW1gC2vPc9OPv8kYEsNvQRrG39Asq0eK8E2m91Ls/w7JFtXc5ViZ1wuAdvoGSVZ
 x91aATty7SXG1ldeYFuGDNTBoDTJbq1Gr+PWZ2t4XZL4mBTJJNJEJJHFJUqk8oT0nbJ4cWzy
 7kxOmXOa08Ymn5Bkm40/8dzJtWc8z5qBAXSFmUAADZk4+MUyjJtAIC1iqgC85R6h/Itw2GKZ
 xv0cDBcHTJQ/9AnAi5dmBL5FMJMGXzmMy6EQZhsssN4gfSGcGSRhyU0b4TfuE3DOUbR8lmI2
 w1/1Q8ssZJKh12BftgkmBvZYRkkfhzJHYGFe6b9MEOy4M0H4OICRw3LHGOZjnJHApsEF0s9R
 sHG6DPdzOByesGBFQGReoZtXKOYVinmFYgVEDQjh9LwqS8XLJLxCxevVWZKTGlUdWKrLk3Zv
 QxMwzRxyAoYG4lXCTcMwXUQqTvNnVU4AaVwcInRUR6SLhJmKs+c4rSZDq1dyvBPELz1XjEeG
 ntQslU+ty5DGSxNQojRBniDfgcThwnzm2XERk6XQcac4LpfT/vcwOiDSAIpSzIUvqnYl9RdP
 O0tWhe7ZN2enD6f+Cnt9N2B87sfUgktHzSibvRWPjTJr33viW0fmhuh8W76wIGh7YZ99fqgz
 9li/1ZRkK6ONu/Qx16PsUUeDZxdGD4cc2O/pdY3lyhNLHdFtqx+qK/Ma5j/mbNzauOZ2R/XT
 vSkp7Up3niFNTPDZCukWXMsr/gKK1jwnRAMAAA==
X-CMS-MailID: 20190701122754eucas1p1d3dec4883761c4669591cd4a712dc539
X-Msg-Generator: CA
X-RootMTR: 20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752
References: <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
 <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
 <20190607062802.m5wslx3imiqooq5a@flea>
 <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
 <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561984076;
 bh=Hx0x2zbLgjF0f2X6qYJaj0io7AMHEwjMRrJnmP/v1+4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=DTWV0hy755ozyTq+W60ZrT7/Ho/DdXqpu5b9Qg5dL3ANvIMrKbfKgMJ7p2bTYwPyl
 xfqXeeKUN+UHb8SEdDy64KKgnsQAhbbwG47uU/QgVL1Ky0927ASMTl18KqRwobrJMi
 nC9wsGxp4kg/9hFs0Wy2tCUN5TStoCpY9ZlS3Ii8=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEuMDcuMjAxOSAxMTo1OCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBIaSEKPgo+IE9uIEZy
aSwgSnVuIDI4LCAyMDE5IGF0IDEyOjM5OjMyUE0gKzAyMDAsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6
Cj4+IE9uIDEyLjA2LjIwMTkgMTc6MjAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+Pj4gSSBhbSBu
b3Qgc3VyZSBpZiBJIHVuZGVyc3RhbmQgd2hvbGUgZGlzY3Vzc2lvbiBoZXJlLCBidXQgSSBhbHNv
IGRvIG5vdAo+Pj4+IHVuZGVyc3RhbmQgd2hvbGUgZWRwLWNvbm5lY3RvciB0aGluZy4KPj4+IFRo
ZSBjb250ZXh0IGlzIHRoaXMgb25lOgo+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoLzI1NzM1Mi8/c2VyaWVzPTUxMTgyJnJldj0xCj4+PiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjgzMDEyLz9zZXJpZXM9NTYxNjMmcmV2PTEKPj4+IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yODY0NjgvP3Nlcmllcz01Njc3
NiZyZXY9Mgo+Pj4KPj4+IFRMO0RSOiBUaGlzIGJyaWRnZSBpcyBiZWluZyB1c2VkIG9uIEFSTSBs
YXB0b3BzIHRoYXQgY2FuIGNvbWUgd2l0aAo+Pj4gZGlmZmVyZW50IGVEUCBwYW5lbHMuIFNvbWUg
b2YgdGhlc2UgcGFuZWxzIHJlcXVpcmUgYSByZWd1bGF0b3IgdG8gYmUKPj4+IGVuYWJsZWQgZm9y
IHRoZSBwYW5lbCB0byB3b3JrLCBhbmQgdGhpcyBpcyBvYnZpb3VzbHkgc29tZXRoaW5nIHRoYXQK
Pj4+IHNob3VsZCBiZSBpbiB0aGUgRFQuCj4+Pgo+Pj4gSG93ZXZlciwgd2UgY2FuJ3QgcmVhbGx5
IGRlc2NyaWJlIHRoZSBwYW5lbCBpdHNlbGYsIHNpbmNlIHRoZSB2ZW5kb3IKPj4+IHVzZXMgc2V2
ZXJhbCBvZiB0aGVtIGFuZCBqdXN0IHJlbGllcyBvbiB0aGUgZURQIGJ1cyB0byBkbyBpdHMgam9i
IGF0Cj4+PiByZXRyaWV2aW5nIHRoZSBFRElEcy4gQSBnZW5lcmljIHBhbmVsIGlzbid0IHJlYWxs
eSB3b3JraW5nIGVpdGhlcgo+Pj4gc2luY2UgdGhhdCB3b3VsZCBtZWFuIGhhdmluZyBhIGdlbmVy
aWMgYmVoYXZpb3VyIGZvciBhbGwgdGhlIHBhbmVscwo+Pj4gY29ubmVjdGVkIHRvIHRoYXQgYnVz
LCB3aGljaCBpc24ndCB0aGVyZSBlaXRoZXIuCj4+Pgo+Pj4gVGhlIGNvbm5lY3RvciBhbGxvd3Mg
dG8gZXhwb3NlIHRoaXMgbmljZWx5Lgo+PiBBcyBWRVNBIHByZXNlbnRhdGlvbiBzYXlzWzFdIGVE
UCBpcyBiYXNlZCBvbiBEUCBidXQgaXMgbXVjaCBtb3JlCj4+IGZsZXhpYmxlLCBpdCBpcyB1cCB0
byBpbnRlZ3JhdG9yICghISEpIGhvdyB0aGUgY29ubmVjdGlvbiwgcG93ZXIKPj4gdXAvZG93biwg
aW5pdGlhbGl6YXRpb24gc2VxdWVuY2Ugc2hvdWxkIGJlIHBlcmZvcm1lZC4gVHJ5aW5nIHRvIGNv
dmVyCj4+IGV2ZXJ5IHN1Y2ggY2FzZSBpbiBlZHAtY29ubmVjdG9yIHNlZW1zIHRvIG1lIHNpbWls
YXIgdG8gcGFuZWwtc2ltcGxlCj4+IGF0dGVtcHQgZmFpbHVyZS4gTW9yZW92ZXIgdGhlcmUgaXMg
bm8gc3VjaCB0aGluZyBhcyBwaHlzaWNhbCBzdGFuZGFyZAo+PiBlRFAgY29ubmVjdG9yLiBUaWxs
IG5vdyBJIHRob3VnaCBEVCBjb25uZWN0b3Igc2hvdWxkIGRlc2NyaWJlIHBoeXNpY2FsCj4+IGNv
bm5lY3RvciBvbiB0aGUgZGV2aWNlLCBub3cgSSBhbSBsb3N0LCBhcmUgdGhlcmUgc29tZSBEVCBi
aW5kaW5ncwo+PiBndWlkZWxpbmVzIGFib3V0IGRlZmluaXRpb24gb2YgYSBjb25uZWN0b3I/Cj4g
VGhpcyBtaWdodCBiZSBzZW1hbnRpY3MgYnV0IEkgZ3Vlc3Mgd2UncmUgaW4gc29tZSBraW5kIG9m
IGdyZXkgYXJlYT8KPgo+IExpa2UsIGZvciBlRFAsIGlmIGl0J3Mgc29sZGVyZWQgSSBndWVzcyB3
ZSBjb3VsZCBzYXkgdGhhdCB0aGVyZSdzIG5vCj4gY29ubmVjdG9yLiBCdXQgd2hhdCBoYXBwZW5z
IGlmIGZvciBzb21lIG90aGVyIGJvYXJkLCB0aGF0IHNpZ25hbCBpcwo+IHJvdXRlZCB0aHJvdWdo
IGEgcmliYm9uPwo+Cj4gWW91IGNvdWxkIGFyZ3VlIHRoYXQgdGhlcmUncyBubyBwaHlzaWNhbCBj
b25uZWN0b3IgaW4gYm90aCBjYXNlcywgb3IKPiB0aGF0IHRoZXJlJ3Mgb25lIGluIGJvdGgsIG9y
IG9uZSBmb3IgdGhlIHJpYmJvbiBhbmQgbm8gY29ubmVjdG9yIGZvcgo+IHRoZSBvbmUgc29sZGVy
ZWQgaW4uCgoKVGhpcyBpcyBub3QgYWJvdXQgcmliYm9uIHZzIHNvbGRlcmluZy4gSXQgaXMgYWJv
dXQgdXNhZ2U6IHRoaXMKY29ubmVjdGlvbiBpcyBzdGF0aWMgYWNyb3NzIHRoZSB3aG9sZSBsaWZl
IG9mIHRoZSBkZXZpY2UgKGV4Y2VwdApleGNlcHRpb25hbCB0aGluZ3M6IHJlcGFpciwgbm9uLXN0
YW5kYXJkIHVzYWdlLCBldGMpLgoKQW5kICJ0aGUgcmVhbCBjb25uZWN0b3IiIGlzIChhdCBsZWFz
dCBmb3IgbWUpIHNvbWV0aGluZyB3aGVyZSBlbmQtdXNlcgpjYW4gY29ubmVjdC9kaXNjb25uZWN0
IGRpZmZlcmVudCB0aGluZ3M6IFVTQiwgSERNSSwgZXRoZXJuZXQsIGV0Yy4gQW5kCm9idmlvdXNs
eSB0byBiZSBmdW5jdGlvbmFsIGl0IHNob3VsZCBiZSBzb21laG93IHN0YW5kYXJkaXplZC4gU28g
ZXZlbiBpZgp0aGVyZSBjb3VsZCBiZSBzb21lIGdyZXkgYXJlYSwgSSBkbyBub3Qgc2VlIGl0IGhl
cmUuCgoKPgo+PiBNYXliZSBpbnN0ZWFkIG9mIGVkcC1jb25uZWN0b3Igb25lIHdvdWxkIGludHJv
ZHVjZSBpbnRlZ3JhdG9yJ3Mgc3BlY2lmaWMKPj4gY29ubmVjdG9yLCBmb3IgZXhhbXBsZSB3aXRo
IGNvbXBhdGlibGUgIm9saW1leCx0ZXJlcy1lZHAtY29ubmVjdG9yIgo+PiB3aGljaCBzaG91bGQg
Zm9sbG93IGVkcCBhYnN0cmFjdCBjb25uZWN0b3IgcnVsZXM/IFRoaXMgd2lsbCBiZSBhdCBsZWFz
dAo+PiBjb25zaXN0ZW50IHdpdGggYmVsb3cgcHJlc2VudGF0aW9uWzFdIC0gZURQIHJlcXVpcmVt
ZW50cyBkZXBlbmRzIG9uCj4+IGludGVncmF0b3IuIFRoZW4gaWYgb2xpbWV4IGhhcyBzdGFuZGFy
ZCB3YXkgb2YgZGVhbGluZyB3aXRoIHBhbmVscwo+PiBwcmVzZW50IGluIG9saW1leC90ZXJlcyBw
bGF0Zm9ybXMgdGhlIGRyaXZlciB3b3VsZCB0aGVuIGNyZWF0ZQo+PiBkcm1fcGFuZWwvZHJtX2Nv
bm5lY3Rvci9kcm1fYnJpZGdlKD8pIGFjY29yZGluZyB0byB0aGVzZSBydWxlcywgSSBndWVzcy4K
Pj4gQW55d2F5IGl0IHN0aWxsIGxvb2tzIGZpc2h5IGZvciBtZSA6KSwgbWF5YmUgYmVjYXVzZSBJ
IGFtIG5vdAo+PiBmYW1pbGlhcml6ZWQgd2l0aCBkZXRhaWxzIG9mIHRoZXNlIHBsYXRmb3Jtcy4K
PiBUaGF0IG1ha2VzIHNlbnNlIHllcwoKCkFuZCB3aGF0IGlmIHNvbWUgcGFuZWwgY2FuIGJlIHVz
ZWQgd2l0aCB0aGlzIHBzZXVkby1jb25uZWN0ZXIgYW5kIGluCnNvbWUgZGlmZmVyZW50IGh3IGRp
cmVjdGx5PyBDb2RlIGR1cGxpY2F0aW9uPyBEVCBvdmVybGF5cz8KCgpSZWdhcmRzCgpBbmRyemVq
CgoKPgo+IE1heGltZQo+Cj4gLS0KPiBNYXhpbWUgUmlwYXJkLCBCb290bGluCj4gRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
