Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104FE8612B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 13:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AD2890A8;
	Thu,  8 Aug 2019 11:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5596898EA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 11:54:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190808115424euoutp02fc779756254bdb53e2e6e20a49ce0f3e~48HcDGKpY1878718787euoutp02c
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 11:54:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190808115424euoutp02fc779756254bdb53e2e6e20a49ce0f3e~48HcDGKpY1878718787euoutp02c
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190808115424eucas1p11f42a45a4cffeecdea8e6a67d5d98fdd~48HbsZPbn2470224702eucas1p1w;
 Thu,  8 Aug 2019 11:54:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 26.96.04309.F6D0C4D5; Thu,  8
 Aug 2019 12:54:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190808115423eucas1p100096334bfd05732d85965afc554575e~48HaykRhG1654816548eucas1p1A;
 Thu,  8 Aug 2019 11:54:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190808115423eusmtrp19930bd4962db2d85e6757009a335fca2~48HaxO7Xm1331613316eusmtrp1Z;
 Thu,  8 Aug 2019 11:54:23 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-46-5d4c0d6f73fa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 54.D6.04117.E6D0C4D5; Thu,  8
 Aug 2019 12:54:23 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190808115422eusmtip12dc9921985d4a6756c3f1c0b8133724c~48HalV5mZ2420324203eusmtip1c;
 Thu,  8 Aug 2019 11:54:22 +0000 (GMT)
Subject: Re: [PATCH 21/21] drm/bridge: tc358767: Use DP nomenclature
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1db37182-ff44-fdf9-18b5-0e54cde2c28c@samsung.com>
Date: Thu, 8 Aug 2019 13:54:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:69.0) Gecko/20100101
 Thunderbird/69.0
MIME-Version: 1.0
In-Reply-To: <20190805122350.8838-21-thierry.reding@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZduzned18Xp9YgzObFSyufH3PZvFz1zwW
 ByaPnbPusnvc7z7OFMAUxWWTkpqTWZZapG+XwJWxc9J+loKFnBXTd8xha2C8z97FyMkhIWAi
 0TJ5F1MXIxeHkMAKRomZU69BOV8YJS7197JBOJ8ZJW5NXwnX0jTvElTVckaJr91zoJy3jBIP
 b05k7WLk4BAWcJE48iEapEFEIEBi1iqQHZwcbAKaEn8332QDsXkF7CROt21lBbFZBFQkzk2a
 zwxiiwqESaxduJkFokZQ4uTMJ2A2J1D9vp2NYEcwC8hLNG+dzQxhi0vcejKfCeK492wSz87Z
 QdguEs+OzmKFsIUlXh3fAvWAjMTpyT0sEHa9xP0VLcwg90sIdDBKbN2wkxkiYS1x+PhFsF+Y
 gY5ev0sfIuwo8XlnLxNIWEKAT+LGW0GIE/gkJm2bzgwR5pXoaBOCqFaUuH92K9RAcYmlF76y
 QdgeEmcezmGcwKg4C8mTs5A8NgvJY7MQbljAyLKKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/
 dxMjMGWc/nf8yw7GXX+SDjEKcDAq8fAWnPCOFWJNLCuuzD3EKMHBrCTCe6/MM1aINyWxsiq1
 KD++qDQntfgQozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QDow1jk2/SwstnxDdb73CX
 sX8m/cA7z+G53Odp2Vts2Mv2Fvnc15RcXzXNg6lsEc+jx/P4bZ7sanFJErW4+OpG0pVA+/IL
 /HutNxT3WBzWvS8h0pOXpDX9+3b25UobzsstimcPvaZ/rWpZmuFKvZsLlh+VPTp/Tuf8226/
 HPaU676a+vEzi2HSDyWW4oxEQy3mouJEABRYaScVAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4Xd18Xp9Yg95PjBZXvr5ns/i5ax6L
 A5PHzll32T3udx9nCmCK0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJ
 Sc3JLEst0rdL0MvYOWk/S8FCzorpO+awNTDeZ+9i5OSQEDCRaJp3iamLkYtDSGApo8SyFy8Y
 IRLiErvnv2WGsIUl/lzrYgOxhQReM0o0/EvvYuTgEBZwkTjyIRokLCLgJ/HqTycjxJwjjBL3
 fkxiAUmwCWhK/N18E6yXV8BO4nTbVlYQm0VAReLcpPlg80UFwiRu3LvHCFEjKHFy5hOwXk6g
 +n07G8EOZRZQl/gz7xIzhC0v0bx1NpQtLnHryXymCYyCs5C0z0LSMgtJyywkLQsYWVYxiqSW
 Fuem5xYb6RUn5haX5qXrJefnbmIERsO2Yz+37GDsehd8iFGAg1GJh7fghHesEGtiWXFl7iFG
 CQ5mJRHee2WesUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD4zUvJJ4Q1NDcwtLQ3Njc2Mz
 CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjDtLAg2mKk40mnf9/r5fDE37T3Xftzvib/9I
 S+jW/4nzTt3uPvxqh//yNTsec57xfpY3eekSruJCtpxdXbtKXFqO3Luzf9299Ke30h1mqOY1
 /9fTCvMUSHy7el7qtEn/GMvybYyLn7nK7auaceV4p41S7KSrq3rYtymZGt9071u0etr+kKga
 7iIlluKMREMt5qLiRACc1TZcnAIAAA==
X-CMS-MailID: 20190808115423eucas1p100096334bfd05732d85965afc554575e
X-Msg-Generator: CA
X-RootMTR: 20190805122436epcas2p2113d52c182a126eb0f4b1f56de764a63
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190805122436epcas2p2113d52c182a126eb0f4b1f56de764a63
References: <20190805122350.8838-1-thierry.reding@gmail.com>
 <CGME20190805122436epcas2p2113d52c182a126eb0f4b1f56de764a63@epcas2p2.samsung.com>
 <20190805122350.8838-21-thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1565265264;
 bh=RqCyhPm1XtNlx/QpzIbnFLqu/4dRZU0trdk9aUhDS1M=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=MGZzfI0T7ARxvqeZ9RhMykgiwfJ3KCAUjHPBK0ccYyxDrWxQJYvFc0cNvHn6JyZSb
 r9Qr2xdyev1yGeXKLB61vE7bkPJJUJIMz5Pqr7iy/aZkJLgCIB2aOpbcrMVLRi4+Jx
 OHGlzKdKMlg6z98MDNr9uDDWR2D8JINiP/V320Po=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUuMDguMjAxOSAxNDoyMywgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gRnJvbTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPgo+IFRoZSBEUCBzcGVjaWZpY2F0aW9uIHVz
ZXMgdGhlIHRlcm0gImRlZmF1bHQgZnJhbWluZyIgaW5zdGVhZCBvZiAibm9uLQo+IGVuaGFuY2Vk
IGZyYW1pbmciLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZp
ZGlhLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBpbmRleCAxYmJmY2M1
NTM0YWIuLmM3NzlmZTY0MjdmNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBA
QCAtNjk5LDggKzY5OSw3IEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMoc3RydWN0
IHRjX2RhdGEgKnRjKQo+ICAJCXRjLT5saW5rLmJhc2UucmV2aXNpb24gPj4gNCwgdGMtPmxpbmsu
YmFzZS5yZXZpc2lvbiAmIDB4MGYsCj4gIAkJKHRjLT5saW5rLmJhc2UucmF0ZSA9PSAxNjIwMDAp
ID8gIjEuNjJHYnBzIiA6ICIyLjdHYnBzIiwKPiAgCQl0Yy0+bGluay5iYXNlLmxhbmVzLAo+IC0J
CXRjLT5saW5rLmJhc2UuY2Fwcy5lbmhhbmNlZF9mcmFtaW5nID8gImVuaGFuY2VkIiA6Cj4gLQkJ
CSJub24tZW5oYW5jZWQiKTsKPiArCQl0Yy0+bGluay5iYXNlLmNhcHMuZW5oYW5jZWRfZnJhbWlu
ZyA/ICJlbmhhbmNlZCIgOiAiZGVmYXVsdCIpOwo+ICAJZGV2X2RiZyh0Yy0+ZGV2LCAiRG93bnNw
cmVhZDogJXMsIHNjcmFtYmxlcjogJXNcbiIsCj4gIAkJdGMtPmxpbmsuc3ByZWFkID8gIjAuNSUi
IDogIjAuMCUiLAo+ICAJCXRjLT5saW5rLnNjcmFtYmxlcl9kaXMgPyAiZGlzYWJsZWQiIDogImVu
YWJsZWQiKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
