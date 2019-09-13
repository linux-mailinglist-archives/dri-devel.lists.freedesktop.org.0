Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F10B1A99
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBC16EEEE;
	Fri, 13 Sep 2019 09:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0636EEEF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:15:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190913091547euoutp014d2404a5e7544f8230119f86c9f7f7a5~D9LOBygOc1141411414euoutp01k
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:15:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190913091547euoutp014d2404a5e7544f8230119f86c9f7f7a5~D9LOBygOc1141411414euoutp01k
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190913091546eucas1p28a71702dd105aaf9caf2f1c16f8ed313~D9LNXOJPV0954009540eucas1p2H;
 Fri, 13 Sep 2019 09:15:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1B.2E.04374.24E5B7D5; Fri, 13
 Sep 2019 10:15:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190913091545eucas1p17e7a786e078fdc38ae56b1cd56e30543~D9LMh7_gR1367913679eucas1p1C;
 Fri, 13 Sep 2019 09:15:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190913091545eusmtrp23bf17003f06fe85b2bde552261e5553a~D9LMT1BFD2926629266eusmtrp23;
 Fri, 13 Sep 2019 09:15:45 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-3d-5d7b5e42f38c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 44.53.04166.14E5B7D5; Fri, 13
 Sep 2019 10:15:45 +0100 (BST)
Received: from [106.120.51.73] (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190913091544eusmtip223f7b61a5537b436821aa1ceb5f8b59e~D9LLzUcX63102731027eusmtip2G;
 Fri, 13 Sep 2019 09:15:44 +0000 (GMT)
Subject: Re: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Rotator to
 dt-schema
To: Krzysztof Kozlowski <krzk@kernel.org>, Maciej Falkowski
 <m.falkowski@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e082996a-743d-807a-38c0-dee65b490771@samsung.com>
Date: Fri, 13 Sep 2019 11:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913062945.GA10283@pi3>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJKsWRmVeSWpSXmKPExsWy7djPc7pOcdWxBlcns1ncWneO1aL33Ekm
 i//bJjJbzD8C5F75+p7N4vz5DewWl3fNYbOYcX4fk8WD5nVsFkuvX2SyaN17hN2B22PNvDWM
 Hnu/LWDx2LSqk81j+7cHrB73u48zefRtWcXo8XmTXAB7FJdNSmpOZllqkb5dAlfGqwu32Av+
 cFSs3PSdsYGxl72LkZNDQsBE4ufiM6wgtpDACkaJ3/vsuhi5gOwvjBJP1pxlhnA+M0rM2tnE
 BNNx4tl2dojEckaJj4/vMEE4bxkl3v05zwhSJSwQJrH8UwsLiC0iEC6x6OQRsFHMAi8YJT49
 nQI2ik3AUKLrbRcbiM0rYCcx481EsDiLgKrEi+bbYLaoQITEpweHWSFqBCVOznwCNpRTQFOi
 /dI7sDizgLzE9rdzmCFscYlbT+aDXSQhcItdYt/ByUALOIAcF4lD+xUhXhCWeHV8CzQAZCT+
 74Spb2aUeHhuLTuE08MocblpBiNElbXE4eMXWUEGMQNtXr9LHyLsKPHyRSs7xHw+iRtvBSFu
 4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjEPIFRaRaSz2Yh+WYWkm9mIexdwMiyilE8tbQ4
 Nz212DgvtVyvODG3uDQvXS85P3cTIzCBnf53/OsOxn1/kg4xCnAwKvHwWuhUxQqxJpYVV+Ye
 YpTgYFYS4fV5UxkrxJuSWFmVWpQfX1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJ
 g1OqgVHl73O7mXMdLi2vyOuv/vL3ZegtPb0LV3QzFGenF84/bfgw/fez4ysf6Si+XcsX9rxy
 wTqGSI2dAX16pguizR8Usz2xSpL9LvKgfrY296XwkH4vh9oW5RNXLB2frJ934Zx99ckbxh8S
 Oj8/vZWes2vtbQuxnqoL080W3vsc/0Gb9ev7Nc/r365VYinOSDTUYi4qTgQAKJNCfFwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsVy+t/xe7qOcdWxBrvn8FjcWneO1aL33Ekm
 i//bJjJbzD8C5F75+p7N4vz5DewWl3fNYbOYcX4fk8WD5nVsFkuvX2SyaN17hN2B22PNvDWM
 Hnu/LWDx2LSqk81j+7cHrB73u48zefRtWcXo8XmTXAB7lJ5NUX5pSapCRn5xia1StKGFkZ6h
 pYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7Gqwu32Av+cFSs3PSdsYGxl72LkZNDQsBE
 4sSz7UA2F4eQwFJGiUsT17JAJGQkTk5rYIWwhSX+XOtigyh6zSjRuuAZE0hCWCBMYvmnFrAG
 EYFwiSsL7jODFDELvGCUePzhHdTYe4wSP5qvsoFUsQkYSnS97QKzeQXsJGa8mQg2iUVAVeJF
 820wW1QgQuLwjlmMEDWCEidnPgHbwCmgKdF+6R3YScwCZhLzNj9khrDlJba/nQNli0vcejKf
 aQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgVG77djPzTsY
 L20MPsQowMGoxMNroVMVK8SaWFZcmXuIUYKDWUmE1+dNZawQb0piZVVqUX58UWlOavEhRlOg
 5yYyS4km5wMTSl5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsbm
 pqXHC6z2c3tPX8aoWvZF33WZ6NnOtvpNWzhklm1qizjG/3yW57r7Lh+3rir5yJ+7i7/FgE0n
 cjJrQKPrrHSDN5p7XxpdFTncKCrovXanQ2P1nbnH5mzavMBSg5e95eGa6RxXf0SoTFTlv9H7
 LWuCUb7Oe2OHy4s8VYR81Wapdk99oOqdG6vEUpyRaKjFXFScCAD/MUv48AIAAA==
X-CMS-MailID: 20190913091545eucas1p17e7a786e078fdc38ae56b1cd56e30543
X-Msg-Generator: CA
X-RootMTR: 20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a
References: <20190912093315.5744-1-m.falkowski@samsung.com>
 <CGME20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a@eucas1p2.samsung.com>
 <20190912161538.4321-1-m.falkowski@samsung.com> <20190913062945.GA10283@pi3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568366147;
 bh=PR7plf5xfUSTBIvJtmBM06aLqddyK3IZ5QA/vHAAwdw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=aOg4KrmrmGdFVwzw6e0usS8/Yv3K4SANdhFp94RdkDEyCZN/xVZJ0VXvgMwklM8PP
 Vf5/260J5pGsWYjSre47xnEBidyoq7kEZHr2A5to9DW7WwlVzwwPqle7YhPpspjbzz
 FDdheFdQ4C+W+9MeUcrPtLy+CeHGhSij4/Gf+rB4=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLAoKT24gOS8xMy8xOSA4OjI5IEFNLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIFRodSwgU2VwIDEyLCAyMDE5IGF0IDA2OjE1OjM4UE0gKzAyMDAsIE1hY2llaiBG
YWxrb3dza2kgd3JvdGU6Cj4+IENvbnZlcnQgU2Ftc3VuZyBJbWFnZSBSb3RhdG9yIHRvIG5ld2Vy
IGR0LXNjaGVtYSBmb3JtYXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBGYWxrb3dza2kg
PG0uZmFsa293c2tpQHNhbXN1bmcuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93
c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4gSnVzdCB0byBtYWtlIGl0IGNsZWFyLCBN
YXJlaydzIHNpZ25lZC1vZmYgc2hvdWxkIGFwcGVhciBmb3Igb25lIG9mCj4gY29uZGl0aW9uczoK
PiAgIC0gaGUgY29udHJpYnV0ZWQgc29tZSBzb3VyY2UgY29kZSB0byB5b3VyIHBhdGNoLAo+ICAg
LSBoZSB0b29rIHlvdXIgcGF0Y2gsIHJlYmFzZWQsIHNlbmQgYnkgaGltc2VsZiAobm90IGEgY2Fz
ZSBoZXJlLCBJCj4gICAgIHRoaW5rKSwKPiAgIC0gaGUgY29udHJpYnV0ZWQgc2lnbmlmaWNhbnQg
aWRlYXMsIGFsdGhvdWdoIGZvciB0aGlzIHRoZXJlIGlzIGEKPiAgICAgIkNvLWRldmVsb3BlZC1i
eSIgdGFnLgo+Cj4gSWYgc29tZW9uZSBtYWRlIGp1c3QgcmV2aWV3IC0gYWRkIFJldmlld2VkLWJ5
LiBJZiBzb21lb25lIHN1Z2dlc3RlZCB0aGUKPiBwYXRjaCAtIGFkZCBTdWdnZXN0ZWQtYnkuCgpN
eSBzaWduZWQtb2ZmIGhlcmUgd2FzIGFkZGVkIHRvIG1hcmsgdGhhdCB0aGlzIHBhdGNoIGlzIGFs
bG93ZWQgdG8gYmUgCnN1Ym1pdHRlZCB0byB0aGUgcHVibGljIG1haWxpbmcgbGlzdCwgYXMgSSBo
YXZlIHJlcXVpcmVkIGNvbXBhbnkgCnBlcm1pc3Npb25zIGZvciBzdWNoIGFjdGl2aXR5LiBJdCBp
cyBub3QgdGhhdCB1bmNvbW1vbiB0aGF0IGEgZ2l2ZW4gCnBhdGNoIGhhcyBtb3JlIHRoYW4gb25l
IHNpZ25lZC1vZmYgYW5kIHN0aWxsIHRoZSBtYWluIGF1dGhvciBoYXMgdGhlIApmaXJzdCBzaWdu
ZWQtb2ZmIHRhZy4KCiA+IC4uLgoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQ
aEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
