Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF72EFE85
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303C06EA56;
	Tue,  5 Nov 2019 13:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C3D6E8DC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 02:23:28 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id f19so12881324pgn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 18:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=/XQPTUQdnIxsmo3yaVIj6Nhp7ayUgTHZ2bwUnPNImsM=;
 b=AFHxAdAO0hJzR2YU4A2HF4KWoejTLBbHaN0R/4NdJ0SIu9MTyNXhgeCYQ7x8P90rCT
 Gf5b5B6yKaF3sRwbbQGK9mvZ2/WBAhsq3woyIcprEfX1DxwY3hEyIt4El3zgRwJgj+BG
 iDVXNpVlT1woebPY9e3tATMVucx4rU7ftT/KMt3eaAGIk+Gs4btGKjML2OHuanIWd+gZ
 aRtmQ/o42Z6NJTdFKIy9yVldOeVGONGlO9E8HOLvfu9s4tbtHzwZTxN93kCnI6a4flwd
 L9C9tw/umo45nB6KwuuObPomwx5GP1tXR+FvsO3pUeEfm84EXVOgXCwwJDG9N2zV9nyr
 igtg==
X-Gm-Message-State: APjAAAVNsP1jf99lW/H0UmgL52CSfmGs1Llo6I1lDlKoDzxtmHNwzXI2
 D5yzR/yCnf3CqvY5U7cNMaA=
X-Google-Smtp-Source: APXvYqyEXXvmBDJFhtUty1uv1FGUNd0Ur5OhXUk9ZCW72Fx+BuP7WqteYWkiW8tLMyajdedzB7HOhQ==
X-Received: by 2002:a63:c103:: with SMTP id w3mr3193120pgf.275.1572920607597; 
 Mon, 04 Nov 2019 18:23:27 -0800 (PST)
Received: from jamal-desktop (97-126-66-56.tukw.qwest.net. [97.126.66.56])
 by smtp.gmail.com with ESMTPSA id u3sm15397779pgp.51.2019.11.04.18.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 18:23:27 -0800 (PST)
From: Jamal Shareef <jamal.k.shareef@gmail.com>
To: outreachy-kernel@googlegroups.com
Subject: [PATCH 1/3] drm/tegra: dc: Remove space after parenthesis
Date: Mon,  4 Nov 2019 18:23:20 -0800
Message-Id: <8e5b985c756f33decd07a728b7fc24b5518b3b47.1572920482.git.jamal.k.shareef@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=/XQPTUQdnIxsmo3yaVIj6Nhp7ayUgTHZ2bwUnPNImsM=;
 b=Jd10ct4X+ROh8H/H8/GovQp0g/sOl6KugUoMq/WSwkvJ/f/QIezkkw31N/HGoIeJNL
 u8JY7bP2fskwM/NYY7xsXG/z+0lWi7vHPZ7TIgksLH7QzYIGi8VpD69aY9SQIfEGt36D
 xtJm1N/H3CazKJ2gaOz6SuRLF63o0PdX8zF9XHCaYtRcDYdlALP71yPxow6PTCtxTP7T
 uG3REIVtR4TTc5RUxcsTwuzl4MAGEOEz+c8V2BYLQao9nMsRtmx2azYwRYsjfjSbQir5
 +frsGoDVKSWGynfv9BGOEYXGy9NMR4njp862VMtTqOrPp96jmOaain5hDH2xhsAUD+F0
 mZ9A==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 Jamal Shareef <jamal.k.shareef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlcyBzcGFjZSBhZnRlciBsZWZ0IHBhcmVudGhlc2lzLiBJc3N1ZSBmb3VuZCBieSBjaGVj
a3BhdGNoLgoKU2lnbmVkLW9mZi1ieTogSmFtYWwgU2hhcmVlZiA8amFtYWwuay5zaGFyZWVmQGdt
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuaCB8IDQwICsrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuaAppbmRleCAwYzRkMTc4NTFmNDcuLjAx
ZmU5Y2MwNzhmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmgKQEAgLTQwNiwxNSArNDA2LDE1IEBAIGludCB0ZWdy
YV9kY19yZ2JfZXhpdChzdHJ1Y3QgdGVncmFfZGMgKmRjKTsKICNkZWZpbmUgRElTUF9PUkRFUl9C
TFVFX1JFRCAgICAgICAgKDEgPDwgOSkKIAogI2RlZmluZSBEQ19ESVNQX0RJU1BfQ09MT1JfQ09O
VFJPTAkJMHg0MzAKLSNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFNjY2ICAgICAoIDAgPDwgMCkKLSNk
ZWZpbmUgQkFTRV9DT0xPUl9TSVpFMTExICAgICAoIDEgPDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xP
Ul9TSVpFMjIyICAgICAoIDIgPDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFMzMzICAgICAo
IDMgPDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFNDQ0ICAgICAoIDQgPDwgMCkKLSNkZWZp
bmUgQkFTRV9DT0xPUl9TSVpFNTU1ICAgICAoIDUgPDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xPUl9T
SVpFNTY1ICAgICAoIDYgPDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFMzMyICAgICAoIDcg
PDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFODg4ICAgICAoIDggPDwgMCkKKyNkZWZpbmUg
QkFTRV9DT0xPUl9TSVpFNjY2ICAgICAoMCA8PCAwKQorI2RlZmluZSBCQVNFX0NPTE9SX1NJWkUx
MTEgICAgICgxIDw8IDApCisjZGVmaW5lIEJBU0VfQ09MT1JfU0laRTIyMiAgICAgKDIgPDwgMCkK
KyNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFMzMzICAgICAoMyA8PCAwKQorI2RlZmluZSBCQVNFX0NP
TE9SX1NJWkU0NDQgICAgICg0IDw8IDApCisjZGVmaW5lIEJBU0VfQ09MT1JfU0laRTU1NSAgICAg
KDUgPDwgMCkKKyNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFNTY1ICAgICAoNiA8PCAwKQorI2RlZmlu
ZSBCQVNFX0NPTE9SX1NJWkUzMzIgICAgICg3IDw8IDApCisjZGVmaW5lIEJBU0VfQ09MT1JfU0la
RTg4OCAgICAgKDggPDwgMCkKICNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFMTAxMDEwICAoMTAgPDwg
MCkKICNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFMTIxMjEyICAoMTIgPDwgMCkKICNkZWZpbmUgRElU
SEVSX0NPTlRST0xfTUFTSyAgICAoMyA8PCA4KQpAQCAtNDIyLDE3ICs0MjIsMTcgQEAgaW50IHRl
Z3JhX2RjX3JnYl9leGl0KHN0cnVjdCB0ZWdyYV9kYyAqZGMpOwogI2RlZmluZSBESVRIRVJfQ09O
VFJPTF9PUkRFUkVEICgyIDw8IDgpCiAjZGVmaW5lIERJVEhFUl9DT05UUk9MX0VSUkRJRkYgKDMg
PDwgOCkKICNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFX01BU0sgICAoMHhmIDw8IDApCi0jZGVmaW5l
IEJBU0VfQ09MT1JfU0laRV82NjYgICAgKCAgMCA8PCAwKQotI2RlZmluZSBCQVNFX0NPTE9SX1NJ
WkVfMTExICAgICggIDEgPDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFXzIyMiAgICAoICAy
IDw8IDApCi0jZGVmaW5lIEJBU0VfQ09MT1JfU0laRV8zMzMgICAgKCAgMyA8PCAwKQotI2RlZmlu
ZSBCQVNFX0NPTE9SX1NJWkVfNDQ0ICAgICggIDQgPDwgMCkKLSNkZWZpbmUgQkFTRV9DT0xPUl9T
SVpFXzU1NSAgICAoICA1IDw8IDApCi0jZGVmaW5lIEJBU0VfQ09MT1JfU0laRV81NjUgICAgKCAg
NiA8PCAwKQotI2RlZmluZSBCQVNFX0NPTE9SX1NJWkVfMzMyICAgICggIDcgPDwgMCkKLSNkZWZp
bmUgQkFTRV9DT0xPUl9TSVpFXzg4OCAgICAoICA4IDw8IDApCi0jZGVmaW5lIEJBU0VfQ09MT1Jf
U0laRV8xMDEwMTAgKCAxMCA8PCAwKQotI2RlZmluZSBCQVNFX0NPTE9SX1NJWkVfMTIxMjEyICgg
MTIgPDwgMCkKKyNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFXzY2NiAgICAoMCA8PCAwKQorI2RlZmlu
ZSBCQVNFX0NPTE9SX1NJWkVfMTExICAgICgxIDw8IDApCisjZGVmaW5lIEJBU0VfQ09MT1JfU0la
RV8yMjIgICAgKDIgPDwgMCkKKyNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFXzMzMyAgICAoMyA8PCAw
KQorI2RlZmluZSBCQVNFX0NPTE9SX1NJWkVfNDQ0ICAgICg0IDw8IDApCisjZGVmaW5lIEJBU0Vf
Q09MT1JfU0laRV81NTUgICAgKDUgPDwgMCkKKyNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFXzU2NSAg
ICAoNiA8PCAwKQorI2RlZmluZSBCQVNFX0NPTE9SX1NJWkVfMzMyICAgICg3IDw8IDApCisjZGVm
aW5lIEJBU0VfQ09MT1JfU0laRV84ODggICAgKDggPDwgMCkKKyNkZWZpbmUgQkFTRV9DT0xPUl9T
SVpFXzEwMTAxMCAoMTAgPDwgMCkKKyNkZWZpbmUgQkFTRV9DT0xPUl9TSVpFXzEyMTIxMiAoMTIg
PDwgMCkKIAogI2RlZmluZSBEQ19ESVNQX1NISUZUX0NMT0NLX09QVElPTlMJCTB4NDMxCiAjZGVm
aW5lICBTQzFfSF9RVUFMSUZJRVJfTk9ORQkoMSA8PCAxNikKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
