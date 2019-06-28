Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6D59C09
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49146E8E4;
	Fri, 28 Jun 2019 12:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB546E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:54:07 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628125405euoutp017585b9f9397f3152d7945eb8a635792c~sXe2ay7hQ3247532475euoutp01E;
 Fri, 28 Jun 2019 12:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190628125405euoutp017585b9f9397f3152d7945eb8a635792c~sXe2ay7hQ3247532475euoutp01E
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628125405eucas1p19d9de132c7c507269bd5260f8650ca2c~sXe12_QGn2787027870eucas1p10;
 Fri, 28 Jun 2019 12:54:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9A.C4.04298.CED061D5; Fri, 28
 Jun 2019 13:54:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628125404eucas1p2da9a38ced35daa959456b0d0f244d7a2~sXe08o7rC0406704067eucas1p2z;
 Fri, 28 Jun 2019 12:54:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190628125404eusmtrp20e45f3155f71e3978c0ccf59fde6c45a~sXe0tyTrQ0425604256eusmtrp29;
 Fri, 28 Jun 2019 12:54:04 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-af-5d160dec4e13
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4C.93.04140.BED061D5; Fri, 28
 Jun 2019 13:54:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628125402eusmtip2b672e4f40a25f69d3c8db9a125b40c5c~sXezJFTjm0418304183eusmtip2w;
 Fri, 28 Jun 2019 12:54:02 +0000 (GMT)
Subject: Re: [PATCH 28/39] docs: admin-guide: add a series of orphaned
 documents
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <be37b10b-81e1-8258-e149-a27942e98173@samsung.com>
Date: Fri, 28 Jun 2019 14:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7ee0e33575633f689203f582259c2cbdce477176.1561724493.git.mchehab+samsung@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTZxTHfXpfaSi7FqTPfNliDSZKgBnMcjadm2Zud5lLFreYRe1YHXdo
 pEhaYVO/kOEoghQpirFUBCG8yWgppLwoCUEttmZIARXqtNOi2dwqXbGZyITR3pDx7XfO+T05
 //PhYQl5CbOcPZB1WNBmqTOVtJS0O6ZvJf0li1e9VWV/B+rctxmwuBwE6J/VMzAXuIzgldHB
 wKX7pTRMWWdpmOjTI6iZfkmB+dZxErzBewh6n1VSMBqapCG/1kJD8dOVUNGmgLZSFnweLwPV
 p/QM2Hx3KOj1JIL3wbQEagrqSCh46EFwwxCgYKTHTIO+0IzgkWtIAo5LozSY/z1NwB8NNQj6
 z/QimAyekECX6yIBw33VEsi/No6g2m5AUNAWQpDnbKSg3XaGgNN9ZSS8sPoo8Bp7JR8k8v/8
 ZCD5kTtugp95aUR868kmiq9qOcZ3NI1L+ID9IeK7TfcZPvD317y9L4GvMLpo3n6vi+DbG9fz
 I7/k8LbmEzQ/WBkgP39jt3RzupB5IFfQpmz5RrrfU/VZtnP1D62GSioPuXERimIxtxE//tFC
 FCEpK+caEfZ52hixeI5wZaGVDFtybgrhntGPFl40THWSotSA8Lg/RIuFH+GW8jEqbMVyO/G0
 oZ4Icxz3NnYOXo9IBFcSjc8ZRpnwgObexWX6ZhRmGbcF5110RZjkEnCJbyziLOO+wl6HlRKd
 pdh5biISKYpT45ba8xGH4BTYM3FBIvKbuNNvJsSowSg8d1kl8oe4znKTFDkWPx3oYEReiee6
 w2+l89yK8KvC3wmx6ES4oXyWFq1N+OqAez4FO79hHbb0pIjtrXgmUEyG25iLwWP+pWKGGGy0
 nyXEtgwXFshFey221lvphbVF3U3EKaQ0LbrMtOga06JrTP/vrUZkM1IIOTpNhqDbkCV8n6xT
 a3Q5WRnJ3x7S2ND8J7k5OxDsQqHhff2IY5EyWvYiOl4lp9S5uiOafoRZQhkne30wTiWXpauP
 HBW0h9K0OZmCrh+tYEmlQnZsyW975FyG+rBwUBCyBe3CVMJGLc9DpXefFH9yctZ29L3Vrgdz
 M6FtqyoUf6peg9xVyVL/ryh2q7tiaFfoxoTgtHxRtm/Xxu3fpW7ae/tC6qfBj6loz5d3Q8uW
 aDYnBScnj6ddX+sM/Tyz4qxJI82VxhgPduxIeX/78/g99uHQtr2pLbsfX0m6Eps9tOaJv7Ym
 rTxx3aP0hPx2Janbr96wntDq1P8BW8Xj/CAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SX0xTZxiH851/Lcxux4ryjZipNWQZxkIL2BfXkSW7ORebW3QXZhPdCZwA
 G21dT8vmnKMTR2sdVRjqLB226hAQRVAraJpg43CtwoYg0RppXHFT2aCD4KwDGbRZwt2T/J7n
 4k1eKSl3M2nSUr1JMOr5MgWTTF1/fm147ahsWUHW9a+1cKL/lgTagj0kWMcaJTAbvYxgprZH
 Aqfu7Wdg8uxzBka6rQg8sWc0uH7ZQ0F44i4C31g9DYNT4wxUHm9jYN/j5XCoPRXa90shEgpL
 wH3AKoGOyBANvtAaCA/HCPBUnaCg6n4Iwc+OKA0Dl1wMWG0uBL8FfyWg59QgA67pOhIenfQg
 8B/0IRif2EtAZ/AYCTe73QRUXr2DwO11IKhqn0JgCTTRcK7jIAl13TUUPD0boSFc6yPeXMP9
 842D4gaG+knu32e1iDvzbTPNNbTu5M433yG4qPc+4rqc9yRc9O+tnLc7nTtUG2Q4791OkjvX
 lMEN9Jq5jpa9DNdXH6Xee+UDpdZoMJuElSUG0fSG4kMVqJWqPFCqc/KUqmxNwXp1riIzX1sk
 lJWWC8bM/I+UJaGGd7YHVn1+xlFPW1A/tqMkKWZz8MnJi5QdJUvl7I8I93qihB1J54bl+Fpb
 ecJZgqeH7EzCGUV4ZjKM5ocl7EYcczSS85zCrsOBvp/iEsnWLMKePyuJRPEQ4T+qL8cLhl2P
 a6wtcZax+dhyLBhnik3H1ZHbknleym7GN8abqISzGAeOjMQ5ieVx6/Ef4g7JvoqnG26SCU7F
 oZGjRIJX4It/ucgDSO5ckDsXJM4FiXNB4kZUC0oRzKKuWCeqlSKvE836YmWhQdeB5r7T2xM7
 34nsY5v8iJUixSKZO3lZgZzmy8UdOj/CUlKRInu5L6VALivid3whGA3bjOYyQfSj3Lnjasi0
 pYWGuV/Xm7apclUayFNpsjXZ60CRKrOxV7bI2WLeJHwiCNsF4/8dIU1Ks6A940erA7df+LLC
 3/J4w7u3KqD0Qeh0ZMsR34Wn+fzVreizqV1Xvl+RseElC/NkKLgylGXjWh/oJxa/1be6d5UJ
 5Xw14LHNxpJGX9NGbxxGzbt279zXZftdNqh6Upel70r7+HWNOtD0qfvS7HeFD9/Xvpja7glm
 zpwu3N34dnpR1qPhCgUllvCqDNIo8v8Bq/m1rrMDAAA=
X-CMS-MailID: 20190628125404eucas1p2da9a38ced35daa959456b0d0f244d7a2
X-Msg-Generator: CA
X-RootMTR: 20190628123124epcas2p3edc3c3a64edf324948a9ec1f9e41b974
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190628123124epcas2p3edc3c3a64edf324948a9ec1f9e41b974
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
 <CGME20190628123124epcas2p3edc3c3a64edf324948a9ec1f9e41b974@epcas2p3.samsung.com>
 <7ee0e33575633f689203f582259c2cbdce477176.1561724493.git.mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561726445;
 bh=qzxIRvVGx/3VyHnGbR9j5H6ALGHkn1ZSDXlE5FAdkwI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ADzWQAhWUQ+KOYVTlCHl+rTDW1I7O0wa+1i03JfoOum+541/Fg80mGMRbZaq9WzRS
 Vx636CdlmOCjtahPKbaaJa+7C9d4mvxObv2wRPluDMrmNC0mfmQwXj6RmcaIdgDzLw
 zgy8jD9s28ngU4LtDmxfsbSWD542++qrS/c1xkYQ=
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rich Felker <dalias@libc.org>, Mike Snitzer <snitzer@redhat.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, linux-efi@vger.kernel.org,
 Willy Tarreau <willy@haproxy.com>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 linux-rtc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Ksenija Stanojevic <ksenija.stanojevic@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-block@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-ntfs-dev@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, linux-crypto@vger.kernel.org,
 linux-video@atrey.karlin.mff.cuni.cz, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjgvMTkgMjozMCBQTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IFRoZXJl
IGFyZSBsb3RzIG9mIGRvY3VtZW50cyB0aGF0IGJlbG9uZyB0byB0aGUgYWRtaW4tZ3VpZGUgYnV0
Cj4gYXJlIG9uIHJhbmRvbSBwbGFjZXMgKG1vc3QgdW5kZXIgRG9jdW1lbnRhdGlvbiByb290IGRp
cikuCj4gCj4gTW92ZSB0aGVtIHRvIHRoZSBhZG1pbiBndWlkZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgoKQWNr
ZWQtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNv
bT4KCj4gLS0tCj4gIERvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1kZXZpY2VzLW5vZGUg
ICAgIHwgIDIgKy0KPiAgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9wcm9jZnMtZGlza3N0YXRz
ICAgICAgfCAgMiArLQo+ICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJsb2NrICAg
ICAgICAgICB8ICAyICstCj4gIC4uLi9BQkkvdGVzdGluZy9zeXNmcy1kZXZpY2VzLXN5c3RlbS1j
cHUgICAgICAgIHwgIDQgKystLQo+ICAuLi4ve2J0bXJ2bC50eHQgPT4gYWRtaW4tZ3VpZGUvYnRt
cnZsLnJzdH0gICAgICB8ICAwCj4gIC4uLi9jbGVhcmluZy13YXJuLW9uY2UucnN0fSAgICAgICAg
ICAgICAgICAgICAgIHwgIDAKPiAgLi4uL3tjcHUtbG9hZC50eHQgPT4gYWRtaW4tZ3VpZGUvY3B1
LWxvYWQucnN0fSAgfCAgMAo+ICAuLi4vY3B1dG9wb2xvZ3kucnN0fSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAwCj4gIC4uLi9hZG1pbi1ndWlkZS9kZXZpY2UtbWFwcGVyL3N0YXRpc3Rp
Y3MucnN0ICAgIHwgIDQgKystLQo+ICAuLi4ve2VmaS1zdHViLnR4dCA9PiBhZG1pbi1ndWlkZS9l
Zmktc3R1Yi5yc3R9ICB8ICAwCj4gIC4uLi97aGlnaHVpZC50eHQgPT4gYWRtaW4tZ3VpZGUvaGln
aHVpZC5yc3R9ICAgIHwgIDAKPiAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9ody12dWxuL2wx
dGYucnN0ICAgICAgfCAgMiArLQo+ICAuLi4vaHdfcmFuZG9tLnJzdH0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAwCj4gIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvaW5kZXgucnN0
ICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgLi4uL3tpb3N0YXRzLnR4dCA9
PiBhZG1pbi1ndWlkZS9pb3N0YXRzLnJzdH0gICAgfCAgMAo+ICBEb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCB8ICAyICstCj4gIC4uLi9rZXJuZWwtcGVyLUNQ
VS1rdGhyZWFkcy5yc3R9ICAgICAgICAgICAgICAgIHwgIDAKPiAgLi4uL2xjZC1wYW5lbC1jZ3Jh
bS5yc3QgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAtLQo+ICBEb2N1bWVudGF0aW9uL3ts
ZG0udHh0ID0+IGFkbWluLWd1aWRlL2xkbS5yc3R9ICB8ICAwCj4gIC4uLi9sb2NrdXAtd2F0Y2hk
b2dzLnJzdH0gICAgICAgICAgICAgICAgICAgICAgIHwgIDAKPiAgLi4uL21tL2NtYV9kZWJ1Z2Zz
LnJzdH0gICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAtLQo+ICBEb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL21tL2luZGV4LnJzdCAgICAgICAgICB8ICAxICsKPiAgLi4uL3tudW1hc3RhdC50
eHQgPT4gYWRtaW4tZ3VpZGUvbnVtYXN0YXQucnN0fSAgfCAgMAo+ICBEb2N1bWVudGF0aW9uL3tw
bnAudHh0ID0+IGFkbWluLWd1aWRlL3BucC5yc3R9ICB8ICAwCj4gIERvY3VtZW50YXRpb24ve3J0
Yy50eHQgPT4gYWRtaW4tZ3VpZGUvcnRjLnJzdH0gIHwgIDAKPiAgLi4uL3tzdmdhLnR4dCA9PiBh
ZG1pbi1ndWlkZS9zdmdhLnJzdH0gICAgICAgICAgfCAgMAo+ICBEb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0ICAgICB8ICAyICstCj4gIC4uLi92aWRlby1vdXRwdXQu
cnN0fSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDAKPiAgRG9jdW1lbnRhdGlvbi9mYi92
ZXNhZmIucnN0ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBEb2N1bWVudGF0aW9uL3g4
Ni90b3BvbG9neS5yc3QgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCj4gIGFy
Y2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAg
YXJjaC9wYXJpc2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+
ICBhcmNoL3NoL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIGFyY2gvc3BhcmMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArKy0tCj4gIGJsb2NrL3BhcnRpdGlvbnMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy9jaGFyL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvY2hhci9od19yYW5kb20vY29yZS5jICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgaW5jbHVkZS9saW51eC9od19yYW5kb20uaCAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+ICA0MCBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAz
MyBkZWxldGlvbnMoLSkKPiAgcmVuYW1lIERvY3VtZW50YXRpb24ve2J0bXJ2bC50eHQgPT4gYWRt
aW4tZ3VpZGUvYnRtcnZsLnJzdH0gKDEwMCUpCj4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL3tjbGVh
cmluZy13YXJuLW9uY2UudHh0ID0+IGFkbWluLWd1aWRlL2NsZWFyaW5nLXdhcm4tb25jZS5yc3R9
ICgxMDAlKQo+ICByZW5hbWUgRG9jdW1lbnRhdGlvbi97Y3B1LWxvYWQudHh0ID0+IGFkbWluLWd1
aWRlL2NwdS1sb2FkLnJzdH0gKDEwMCUpCj4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL3tjcHV0b3Bv
bG9neS50eHQgPT4gYWRtaW4tZ3VpZGUvY3B1dG9wb2xvZ3kucnN0fSAoMTAwJSkKPiAgcmVuYW1l
IERvY3VtZW50YXRpb24ve2VmaS1zdHViLnR4dCA9PiBhZG1pbi1ndWlkZS9lZmktc3R1Yi5yc3R9
ICgxMDAlKQo+ICByZW5hbWUgRG9jdW1lbnRhdGlvbi97aGlnaHVpZC50eHQgPT4gYWRtaW4tZ3Vp
ZGUvaGlnaHVpZC5yc3R9ICgxMDAlKQo+ICByZW5hbWUgRG9jdW1lbnRhdGlvbi97aHdfcmFuZG9t
LnR4dCA9PiBhZG1pbi1ndWlkZS9od19yYW5kb20ucnN0fSAoMTAwJSkKPiAgcmVuYW1lIERvY3Vt
ZW50YXRpb24ve2lvc3RhdHMudHh0ID0+IGFkbWluLWd1aWRlL2lvc3RhdHMucnN0fSAoMTAwJSkK
PiAgcmVuYW1lIERvY3VtZW50YXRpb24ve2tlcm5lbC1wZXItQ1BVLWt0aHJlYWRzLnR4dCA9PiBh
ZG1pbi1ndWlkZS9rZXJuZWwtcGVyLUNQVS1rdGhyZWFkcy5yc3R9ICgxMDAlKQo+ICByZW5hbWUg
RG9jdW1lbnRhdGlvbi97YXV4ZGlzcGxheSA9PiBhZG1pbi1ndWlkZX0vbGNkLXBhbmVsLWNncmFt
LnJzdCAoOTklKQo+ICByZW5hbWUgRG9jdW1lbnRhdGlvbi97bGRtLnR4dCA9PiBhZG1pbi1ndWlk
ZS9sZG0ucnN0fSAoMTAwJSkKPiAgcmVuYW1lIERvY3VtZW50YXRpb24ve2xvY2t1cC13YXRjaGRv
Z3MudHh0ID0+IGFkbWluLWd1aWRlL2xvY2t1cC13YXRjaGRvZ3MucnN0fSAoMTAwJSkKPiAgcmVu
YW1lIERvY3VtZW50YXRpb24ve2NtYS9kZWJ1Z2ZzLnJzdCA9PiBhZG1pbi1ndWlkZS9tbS9jbWFf
ZGVidWdmcy5yc3R9ICg5OCUpCj4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL3tudW1hc3RhdC50eHQg
PT4gYWRtaW4tZ3VpZGUvbnVtYXN0YXQucnN0fSAoMTAwJSkKPiAgcmVuYW1lIERvY3VtZW50YXRp
b24ve3BucC50eHQgPT4gYWRtaW4tZ3VpZGUvcG5wLnJzdH0gKDEwMCUpCj4gIHJlbmFtZSBEb2N1
bWVudGF0aW9uL3tydGMudHh0ID0+IGFkbWluLWd1aWRlL3J0Yy5yc3R9ICgxMDAlKQo+ICByZW5h
bWUgRG9jdW1lbnRhdGlvbi97c3ZnYS50eHQgPT4gYWRtaW4tZ3VpZGUvc3ZnYS5yc3R9ICgxMDAl
KQo+ICByZW5hbWUgRG9jdW1lbnRhdGlvbi97dmlkZW8tb3V0cHV0LnR4dCA9PiBhZG1pbi1ndWlk
ZS92aWRlby1vdXRwdXQucnN0fSAoMTAwJSkKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJv
bmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
