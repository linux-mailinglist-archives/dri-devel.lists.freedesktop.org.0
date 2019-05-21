Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E570725168
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AB88934F;
	Tue, 21 May 2019 14:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2440E8934F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:02:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521140245euoutp017cae1747041eb512ffefb8589f3524cb~gt58-Hhhn0183501835euoutp01J
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:02:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190521140245euoutp017cae1747041eb512ffefb8589f3524cb~gt58-Hhhn0183501835euoutp01J
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190521140245eucas1p21ffe2befeaa9f9bbeb0f706b7c6364d6~gt58pJPn41436614366eucas1p2c;
 Tue, 21 May 2019 14:02:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 07.A2.04298.40504EC5; Tue, 21
 May 2019 15:02:45 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c~gt57qG4jp0623806238eucas1p2d;
 Tue, 21 May 2019 14:02:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190521140243eusmtrp2a771ae2ddba704f9e7a497d19c48dd58~gt57ajZT00523705237eusmtrp2B;
 Tue, 21 May 2019 14:02:43 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-41-5ce405047e28
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 20.34.04146.30504EC5; Tue, 21
 May 2019 15:02:43 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190521140243eusmtip298bff93f3a48fc44783a5af991707dd6~gt57KOC0h0610306103eusmtip21;
 Tue, 21 May 2019 14:02:43 +0000 (GMT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: atafb: remove superfluous function prototypes
Message-ID: <50411fd1-9da0-aab6-709e-749d5e0ce509@samsung.com>
Date: Tue, 21 May 2019 16:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduzneV1W1icxBt8tLK58fc9m8ezWXiaL
 E30fWC0u75rD5sDicehwB6PH/e7jTB6fN8kFMEdx2aSk5mSWpRbp2yVwZXTcryw4xl1xv/MB
 WwPjIc4uRk4OCQETiSlHJjB2MXJxCAmsYJRY8WsvM4TzhVFiQscydgjnM6PE093vWWBa/v14
 wgaRWM4o0fx6PhOE85ZR4tPnv0AtHBwiAroSc34ygTQwCyRInF50D6yZTcBKYmL7KkYQW1jA
 R+LA+UawGl4BO4k9/xtYQWwWAVWJ3eumg9miAhES949tYIWoEZQ4OfMJC8RMcYlbT+ZDzZeX
 2P52DtjZEgKf2STuPPvCBnGpi8TXU7tYIWxhiVfHt7BD2DIS/3dCHC0hsI5R4m/HC6ju7YwS
 yyf/g+q2ljh8/CIryDfMApoS63fpQ4QdJZqezmYDCUsI8EnceCsIcQSfxKRt05khwrwSHW1C
 ENVqEhuWbWCDWdu1cyVUiYfEm2XCExgVZyH5bBaSz2Yh+WwWwgkLGFlWMYqnlhbnpqcWG+al
 lusVJ+YWl+al6yXn525iBCaT0/+Of9rB+PVS0iFGAQ5GJR5ei4ePY4RYE8uKK3MPMUpwMCuJ
 8J4+9ShGiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA6Oq
 BiPn1AmartevvuuT76q7IpIYtvxb8u+YL48emB1pkvrByeR+c7FefLqQrt+JwPiYULPYiFsX
 A+qEzm+xj7nZuOO1wk2e5lP7As4zzmL9eapW4s7vK3rrWBvfrRB+daCKb76Wnd+pE7Ne5AWx
 S33pZH+9QjE6eHrM5H7dinV/Sqt2FygUuiixFGckGmoxFxUnAgCanzzxIgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4PV1m1icxBpe/mVtc+fqezeLZrb1M
 Fif6PrBaXN41h82BxePQ4Q5Gj/vdx5k8Pm+SC2CO0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAz
 MrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvouF9ZcIy74n7nA7YGxkOcXYycHBICJhL/fjxh
 62Lk4hASWMoo0bjqG3sXIwdQQkbi+PoyiBphiT/XuqBqXjNKLO2+xwRSIyKgKzHnJ5jJLJAg
 8WxeCkg5m4CVxMT2VYwgtrCAj8SB841MIDavgJ3Env8NrCA2i4CqxO5108FsUYEIiTPvV7BA
 1AhKnJz5BMxmFlCX+DPvEjOELS5x68l8JghbXmL72znMExgFZiFpmYWkZRaSlllIWhYwsqxi
 FEktLc5Nzy021CtOzC0uzUvXS87P3cQIjIVtx35u3sF4aWPwIUYBDkYlHt4H9x7HCLEmlhVX
 5h5ilOBgVhLhPX3qUYwQb0piZVVqUX58UWlOavEhRlOghyYyS4km5wPjNK8k3tDU0NzC0tDc
 2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2PwaX6NJ6WTbl0zPtF7fkpj/vyFGcU/
 BOSq0myvPPWY6eD77OvF/uqLW9jrfv82WspftW1a1v1z068piL3WXnMs4FdQvNmfM67KtZf/
 fl4fvydoyeSfa9983LhkrbSiosR0jZz/Kmx/rVeW7FabNyHevu2PY+DTo1PXbJjeon3j3Se7
 HWrPtu/IUWIpzkg01GIuKk4EAL1xOhebAgAA
X-CMS-MailID: 20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c
X-Msg-Generator: CA
X-RootMTR: 20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c
References: <CGME20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558447365;
 bh=l6M7Kgw/u9cdmIuexWPozWhYDjVdWoz4ybdUdatYm6Q=;
 h=To:Cc:From:Subject:Date:References:From;
 b=lCPI3x/5T0dqjhvCYEX3/aAY7ITjDsXa9B1P4m3wP5xnAdY0LjYN+0UbOk2gH5nVR
 m12reggub/bONUUUXMm3efvFZ2pNtObqfHWGIe/7pVfXrWVA3KZaxw6N65HWm3XLp7
 Byw/z3BOkqegk5EhW4C3/Yuc2Q/rAS5NVUik1jaE=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCBmb3IgdGhlbS4KCkNjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPgpTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5p
ZXJraWVAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9hdGFmYi5jIHwgICAy
MSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBkZWxldGlvbnMoLSkK
CkluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRhZmIuYwo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvYXRhZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0YWZi
LmMKQEAgLTc3LDI5ICs3Nyw4IEBACiAjZGVmaW5lIFNXSVRDSF9TTkQ3IDB4ODAKICNkZWZpbmUg
U1dJVENIX05PTkUgMHgwMAogCi0KICNkZWZpbmUgdXAoeCwgcikgKCgoeCkgKyAocikgLSAxKSAm
IH4oKHIpLTEpKQogCi0JLyoKLQkgKiBJbnRlcmZhY2UgdG8gdGhlIHdvcmxkCi0JICovCi0KLXN0
YXRpYyBpbnQgYXRhZmJfY2hlY2tfdmFyKHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLCBz
dHJ1Y3QgZmJfaW5mbyAqaW5mbyk7Ci1zdGF0aWMgaW50IGF0YWZiX3NldF9wYXIoc3RydWN0IGZi
X2luZm8gKmluZm8pOwotc3RhdGljIGludCBhdGFmYl9zZXRjb2xyZWcodW5zaWduZWQgaW50IHJl
Z25vLCB1bnNpZ25lZCBpbnQgcmVkLCB1bnNpZ25lZCBpbnQgZ3JlZW4sCi0JCQkgICB1bnNpZ25l
ZCBpbnQgYmx1ZSwgdW5zaWduZWQgaW50IHRyYW5zcCwKLQkJCSAgIHN0cnVjdCBmYl9pbmZvICpp
bmZvKTsKLXN0YXRpYyBpbnQgYXRhZmJfYmxhbmsoaW50IGJsYW5rLCBzdHJ1Y3QgZmJfaW5mbyAq
aW5mbyk7Ci1zdGF0aWMgaW50IGF0YWZiX3Bhbl9kaXNwbGF5KHN0cnVjdCBmYl92YXJfc2NyZWVu
aW5mbyAqdmFyLAotCQkJICAgICBzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7Ci1zdGF0aWMgdm9pZCBh
dGFmYl9maWxscmVjdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywKLQkJCSAgIGNvbnN0IHN0cnVjdCBm
Yl9maWxscmVjdCAqcmVjdCk7Ci1zdGF0aWMgdm9pZCBhdGFmYl9jb3B5YXJlYShzdHJ1Y3QgZmJf
aW5mbyAqaW5mbywKLQkJCSAgIGNvbnN0IHN0cnVjdCBmYl9jb3B5YXJlYSAqcmVnaW9uKTsKLXN0
YXRpYyB2b2lkIGF0YWZiX2ltYWdlYmxpdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3Qgc3Ry
dWN0IGZiX2ltYWdlICppbWFnZSk7Ci1zdGF0aWMgaW50IGF0YWZiX2lvY3RsKHN0cnVjdCBmYl9p
bmZvICppbmZvLCB1bnNpZ25lZCBpbnQgY21kLAotCQkgICAgICAgdW5zaWduZWQgbG9uZyBhcmcp
OwotCiAKIHN0YXRpYyBpbnQgZGVmYXVsdF9wYXI7CQkvKiBkZWZhdWx0IHJlc29sdXRpb24gKDA9
bm9uZSkgKi8KIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
