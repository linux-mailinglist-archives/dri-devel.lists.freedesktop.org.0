Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59F52159
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 05:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8CF89B05;
	Tue, 25 Jun 2019 03:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955B89B05
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 03:49:39 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190625034937epoutp015e0fe632ee90743703d6323974ff506a~rVHmkW3Ti0072900729epoutp013
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 03:49:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190625034937epoutp015e0fe632ee90743703d6323974ff506a~rVHmkW3Ti0072900729epoutp013
Received: from epsmges1p4.samsung.com (unknown [182.195.40.152]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190625034934epcas1p2e0bd4e5da72da33888f94738204b8d7a~rVHkFSV6Q2772627726epcas1p2H;
 Tue, 25 Jun 2019 03:49:34 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.65.04257.EC9911D5; Tue, 25 Jun 2019 12:49:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190625034934epcas1p11690bb933aec1d9b02bcebab9428b9d5~rVHjjjCjk2806828068epcas1p1w;
 Tue, 25 Jun 2019 03:49:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190625034933epsmtrp2a4d1beb11195d2ee9303012b9de78ede~rVHjgO6X81890118901epsmtrp2I;
 Tue, 25 Jun 2019 03:49:33 +0000 (GMT)
X-AuditID: b6c32a38-5e3ff700000010a1-62-5d1199ce154e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B1.63.03692.DC9911D5; Tue, 25 Jun 2019 12:49:33 +0900 (KST)
Received: from [10.240.175.117] (unknown [10.240.175.117]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190625034933epsmtip12b162090d6e30a69f16bb12f20d4dabb~rVHjWP0yd2637426374epsmtip1t;
 Tue, 25 Jun 2019 03:49:33 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] drm/exynos: trigger build of all modules
To: Sam Ravnborg <sam@ravnborg.org>, Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <c11d3bf6-0e01-80bb-7d06-9df566389f01@samsung.com>
Date: Tue, 25 Jun 2019 21:48:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624152944.GA20945@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0gTYRjHe+/m7Watrmn2JIJ62R8F5m46uyKzUmqQhRBEVDIPd6i47cZu
 M7UI+6XOH5VWmquhhZUMypJZKkVg9EMozTSpJBTNohSFyqFZ1OYZ+d/n+b7fl+f5vu9D4qq7
 RCiZbbbxVjNnpIlA2b3Ha2Oiu2qXp6n7HWFsRVcnxo6W9uBs39QkwTb+qJWzZ0fGcLa7+46c
 fXliXM42zrQg9tL5L8RWha7N+UGua3Y7CN1971CAbrDsGaZrqH5D6M543CiVOJCzOYvnDLw1
 gjdnCIZsc2YCvWuvPkmvjVcz0cxGdgMdYeZMfAKdnJIavSPb6BuLjsjljHaflMqJIh2zZbNV
 sNv4iCxBtCXQvMVgtGy0rBc5k2g3Z67PEEybGLVao/UZ03OyWhxuzPI7MG/QM4MKUZGiFJEk
 UHEwcIooRYGkimpF8KBpZr74huBGz2tcKrwIjs92y//d8H5bKukPEfTedM2bJhG8/VyPlSIF
 GUQlQ0V9Ne7nYGobuKomMb8Jp2ox+HXKi/wHBLUGKhsHCT8rqS1w4cItmZ9lPt1RMyH38wpq
 P/R62pHkWQ6dtR/nPApKAxfLRud0nFoJ7z/WYRKHw8mWy3ONgZol4Nw7o8TJMOTqxSQOgq/P
 PHKJQ+H7xENC4sPwaeKTTEp5FLyuPAljoafR4EecWgtN7TGSORLaZl3zAyyFianyAMmthJIi
 lWSh4WnPWyQxwKuGyvk+Onhe7CHOoUjngljOBVGcC6I4/zeuRzI3CuEtoimTFxlL3MKfbkZz
 67qObUUPulI6EEUieoly+imVpgrgcsV8UwcCEqeDldc5n6Q0cPkFvFXQW+1GXuxAWt+rV+Kh
 KzIE3/KbbXpGq4mNjWXjmHgtw9ArlfrF7w6pqEzOxufwvIW3/ruHkYrQQmQvSaupDysYrvJe
 7fygbt9dF3LZJgxPH4n5mf8ksW9qGtTxAp5YV3isRo1Wh78KFxaNO+rKk6oDVxEDxX3ly5qc
 /VF/Rg6+qdpR9Cu9eZOu4rbmceu+4dWj26nKnbi7VzOQ9OLJeB52sox/PsY9ivyTa4pqLriS
 En6x7HTQtb17aJmYxTHrcKvI/QU7iFicxAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnO7ZmYKxBts/m1n0njvJZPG06yKz
 xZWv79ksVnyZyW7R//g1s8X58xvYLc42vWG3WPFzK6PFjMkv2Rw4PXbOusvusWlVJ5vH9m8P
 WD3udx9n8lgy7SqbR9+WVYwBbFFcNimpOZllqUX6dglcGVs7VzEV/OWquL/lJ2MDYxtnFyMH
 h4SAicS3T3xdjFwcQgK7GSUenPnNDhGXkNiylQPCFJY4fLgYouQto8SfIweZuhg5OYQFXCR6
 F0xjBrFFBBwl5k56zwRSxCwwm0liV+MddoiOJUwSF1cuZAOpYhNQlZi44j6YzStgJzFlyloW
 EJsFKN45/R07iC0qECHR1zYbqkZQ4uTMJ2A1nAJGElO7nzKC2MwC6hJ/5l1ihrDFJW49mc8E
 YctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT8
 3E2M4KjS0tzBeHlJ/CFGAQ5GJR7eH8cEYoVYE8uKK3MPMUpwMCuJ8C5NBArxpiRWVqUW5ccX
 leakFh9ilOZgURLnfZp3LFJIID2xJDU7NbUgtQgmy8TBKdXAOIv9TYVtV+vDb6oMk/wq/tx8
 475OvPRxhIX/2hffz6V+W3jFgScsTfrATdcrL1a+/+Cs/Km+ZPbz7yVNCkeP+Gk2ij0ucZQo
 qjm4qj1vnejHw5In5+qf/X+8Yi/r/QdODRcCJxz85Vx9t1uU7/7r3/MZRP7nPE9SWJVWUXrY
 PVTu89OTPXZfZiuxFGckGmoxFxUnAgBTbywjpgIAAA==
X-CMS-MailID: 20190625034934epcas1p11690bb933aec1d9b02bcebab9428b9d5
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190624152954epcas3p33b627481994f3ce1e57f8664b6f51b30
References: <20190622115623.16314-1-sam@ravnborg.org>
 <20190622115623.16314-3-sam@ravnborg.org>
 <CAAQKjZPqunjVctjFJdwJMEmz7DHT8mDgMQ-_a3sw6BGO9K2q2w@mail.gmail.com>
 <CGME20190624152954epcas3p33b627481994f3ce1e57f8664b6f51b30@epcas3p3.samsung.com>
 <20190624152944.GA20945@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561434577;
 bh=lOC4j7zq5jNKDh0zGac5mouObjz6QrJdwnQdmnk1BEo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=gAr2EYzaqvl0Jv5C08lzys/8SGYUdwfLwIr3wRN9lotgkpdmhe8xB84WygRN/bBN/
 rny92QhubwL0a91cFhO759DruIXnkJpDrkECegCFnn8ZbQEotiKgmSgzipnGACQesq
 L/c/jjYnbTH/wZZGuBWBgEwooC77QIALW6LxNnfc=
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gMTkuIDYuIDI1LiDsmKTsoIQgMTI6MjksIFNhbSBSYXZuYm9yZyB3cm90ZToK
PiBIaSBJbmtpCj4gCj4gRnJvbSBjaGFuZ2Vsb2c6Cj4+Pgo+Pj4gSW5jbHVkZSBmaXggb2YgZXh5
bm9zIGJ1aWxkIGZvciBhbHBoYS4KPj4+Cj4gCj4gCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZmJkZXYuYwo+Pj4gaW5kZXggYWVmY2Q2MjRmZTMyLi5iMDg3N2I5NzI5MWMg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYu
Ywo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMKPj4+
IEBAIC0xMCw2ICsxMCw3IEBACj4+Pgo+Pj4gICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+Cj4+
PiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3Zt
YWxsb2MuaD4KPj4KPj4gSXMgdGhpcyBjaGFuZ2UgcmVsYXRlZCB0byB0aGlzIHBhdGNoPwo+IAo+
IFRoaXMgaXMgdGhlIGFib3ZlIG1lbnRpb25lZCBmaXguCj4gQWxwaGEgb2Z0ZW4gbmVlZHMgb25l
IHRvIHB1bGwgaW4gdm1hbGxvYy5oIC0gd2hlcmUgYWxsIG90aGVyCj4gYXJjaGl0ZWN0dXJlcyBn
ZXQgaXQgaW5kaXJlY3QgdmlhIG90aGVyIGhlYWRlcnMuCj4gSSBoYXZlIG5ldmVyIGJvdGhlcmVk
IHRvIGZpbmQgb3V0IHdoeSBhbHBhIG5lZWRzIG1vcmUgaGVhZGVycyBmaWxlcywKPiBidXQgSSBh
bHdheXMgbWFrZSBzdXJlIHRvIHRlc3QgdGhpbmdzIHVzaW5nIGFscGhhIHNvIDAtZGF5IGRvIG5v
dCB5ZWxsIGF0IG1lLgoKSSBjb3VsZG4ndCBzZWUgYW55IHdhcm5pbmcgbWVzc2FnZSB3aGlsZSBi
dWlsZGluZyB5b3VyIHBhdGNoIGFmdGVyIGRyb3BwaW5nIGFib3ZlIGNoYW5nZS4KQ291bGQgeW91
IGNoZWNrIGl0IGFnYWluIG9uIHRvcCBvZiBiZWxvdyBnaXQgcmVwby4/CiBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGFlaW5raS9kcm0tZXh5bm9zLmdpdCBl
eHlub3MtZHJtLW5leHQKCkknbSBnb2luZyB0byByZXF1ZXN0IEdJVC1QVUxMIGFzIHNvb24gYXMg
eW91IGdldCBiYWNrIHRvIG1lLgoKVGhhbmtzLApJbmtpIERhZQoKPiAKPiAJU2FtCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
