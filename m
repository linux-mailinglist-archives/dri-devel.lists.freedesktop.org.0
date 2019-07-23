Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC571A6E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDAA6E2CD;
	Tue, 23 Jul 2019 14:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEE06E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:33:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190723143330euoutp01604fc79f61d85ca4cdd72f1be277abe6~0D9xziyYw3202532025euoutp01M
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:33:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190723143330euoutp01604fc79f61d85ca4cdd72f1be277abe6~0D9xziyYw3202532025euoutp01M
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190723143329eucas1p117643dc9e4f58b19fc3fd45658457b65~0D9xcUAJL2227822278eucas1p1d;
 Tue, 23 Jul 2019 14:33:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 8F.18.04325.9BA173D5; Tue, 23
 Jul 2019 15:33:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190723143329eucas1p211688de2902dbac72998fda9e694083d~0D9wxcVoa0227002270eucas1p2P;
 Tue, 23 Jul 2019 14:33:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190723143328eusmtrp1d686ad3f98ed2c4ffbc8cd8ff46ef3cd~0D9wm7S621424814248eusmtrp1z;
 Tue, 23 Jul 2019 14:33:28 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-f4-5d371ab91671
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C2.4B.04140.8BA173D5; Tue, 23
 Jul 2019 15:33:28 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190723143328eusmtip2bca043c67d7707bbc87be382fc4714f6~0D9wYHACG0251202512eusmtip2B;
 Tue, 23 Jul 2019 14:33:28 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] MAINTAINERS: handle fbdev changes through drm-misc tree
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <d449f697-ed25-8a3f-16d5-b981f1a52217@samsung.com>
Date: Tue, 23 Jul 2019 16:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj227nsOJwcj4YvK7oMChK8lKGjbGT0Y/0r0Ahj5NSDim7ajvNS
 EKMfTVaEusochgrm3LxmNm+oOdFZgiUaRJAXMlHT0ua84KWcR8l/z/t8z/N+z/PxURhTQEio
 VE0Wq9Wo0qWkCLf3r38MbpNEKsNqlySyislvmGzU/ZuUDTxZJGQj7aXkJVzRuVKOK8YfOQUK
 V9PRa1icKCqJTU/NZrWh8nhRyrv5eizTKsydbPog0KMa0oi8KaDPgd1mEBqRiGLoagRDHba9
 YRlB67QBeVQM7UIwtpW471j/7CZ4kQVB8/YG4ocFBD0uF+5RkfR5KDTYdt3+tAL6ZheFHhxA
 x0N18YtdHqODYG1iZjeHmJZD3c+BHZ6icPok9M1Ee+hD9E0Y728keIkfvC+ZwnlrIHydKhPw
 +Bi0LJRingxAr5Lw/UcX6dkD9BXYfCDlQ/vDnLNZyOMjMGh6jPP6egRb+TN75hYEFtP23sNc
 gF7nMOFZhNGnoaE9lKejwb24RvD7feHLgh+fwReK7MUYT4sh/yHDq09BY1UjuX+tsc2K8VgB
 RssYWYBOmA80Mx9oZj7QzPw/QznCbSiQ1XHqZJYL17A5IZxKzek0ySGJGeomtPNPBred7lbU
 tZngQDSFpD7iXEGkkiFU2Vye2oGAwqQB4uv6CCUjTlLl3WW1Gbe1unSWc6DDFC4NFN/zmrjF
 0MmqLDaNZTNZ7f6pgPKW6JHV0JOHjE/dr33e6JiY8O7pv8o/DaGZNypedSrQ8rPL5YxluBWT
 bywl5hTVREW12+djRQUjb+ueX53YCpfH39ms1MekCI/fD0G93aaVUZjrEwgjimdLNB2/gi/S
 3FCOQ3L2ZVbluFcVfKpNWy3srdKHrZvKrHFkLBWZUEJIcS5FdSYI03Kqf8WIJhsjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42I5/e/4Pd0dUuaxBg9uGVgsfHiX2eLK1/ds
 Fif6PrBaXN41h82BxWPvtwUsHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdx4M065oKV7BUPN51iamBczdbFyMkhIWAi8fPq
 V9YuRi4OIYGljBJPT95l6WLkAErISBxfXwZRIyzx51oXG0TNa0aJ/RtmM4Mk2ASsJCa2r2IE
 sYUFPCSOvvzADmKLCCRIPH09H2wBs4CWxI8HL8BsXgE7ibWvTzCCzGcRUJU4+sIRJCwqECFx
 5v0KFogSQYmTM5+wQLSqS/yZd4kZwhaXuPVkPhOELS+x/e0c5gmMArOQtMxC0jILScssJC0L
 GFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBMbDtmM/t+xg7HoXfIhRgINRiYe3gsk8Vog1
 say4MvcQowQHs5IIb2CDWawQb0piZVVqUX58UWlOavEhRlOgfyYyS4km5wNjNa8k3tDU0NzC
 0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+OuFfGf769+2HZRo0G5p23x3qTf
 N02DVDVOGy9Pv7lZ/KLsEQn3cNeX26YVv9nhpvtLpOrplodZwrmhU78ybi58d2yJ8WLTF/9n
 aTovdra/HPy1w4eZRftI6o/Wd3su+qa/s5tQyz3JpXVX5Yo112Kvnuis/PZBVNfx2w5Xu+mx
 D4z2LGhaHKCkxFKckWioxVxUnAgAtVDmyZ0CAAA=
X-CMS-MailID: 20190723143329eucas1p211688de2902dbac72998fda9e694083d
X-Msg-Generator: CA
X-RootMTR: 20190723143329eucas1p211688de2902dbac72998fda9e694083d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190723143329eucas1p211688de2902dbac72998fda9e694083d
References: <CGME20190723143329eucas1p211688de2902dbac72998fda9e694083d@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563892410;
 bh=3dI4WSCN1Syoio6H4JGJkxvn3KNeiKfNxDeEQLSlaYU=;
 h=From:Subject:To:Cc:Date:References:From;
 b=UiUhSzPc5CZRddVea4ybmGKb4JwVOOvz0Mt83DAxjdekSa7lxt1nJDsmiqIKVqUIB
 a5OuIK63D8rvPOHEs8X7EvI9gCf+HExIzliDCO5jz2VKCHDdoDMxXnX9TP966IsNgk
 TcxTBhqH7Chy5Y3kvulrLKyNQHMyrVAdb0aJIddU=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZmJkZXYgcGF0Y2hlcyB3aWxsIG5vdyBnbyB0byB1cHN0cmVhbSB0aHJvdWdoIGRybS1taXNjIHRy
ZWUgKElPVwpzdGFydGluZyB3aXRoIHY1LjQgbWVyZ2Ugd2luZG93IGZiZGV2IGNoYW5nZXMgd2ls
bCBiZSBpbmNsdWRlZCBpbgpEUk0gcHVsbCByZXF1ZXN0KSBmb3IgaW1wcm92ZWQgbWFpbnRhaW5l
cnNoaXAgYW5kIGJldHRlciBpbnRlZ3JhdGlvbgp0ZXN0aW5nLiBVcGRhdGUgTUFJTlRBSU5FUlMg
ZmlsZSBhY2NvcmRpbmdseS4KCkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJr
aWVAc2Ftc3VuZy5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAgICAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkluZGV4OiBiL01BSU5UQUlORVJTCj09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTYzODksNyAr
NjM4OSw3IEBAIEZSQU1FQlVGRkVSIExBWUVSCiBNOglCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6
IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CiBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCiBMOglsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKLVQ6CWdpdCBnaXQ6Ly9naXRo
dWIuY29tL2J6b2xuaWVyL2xpbnV4LmdpdAorVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0
b3Aub3JnL2RybS9kcm0tbWlzYwogUToJaHR0cDovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtZmJkZXYvbGlzdC8KIFM6CU1haW50YWluZWQKIEY6CURvY3VtZW50YXRpb24vZmIv
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
