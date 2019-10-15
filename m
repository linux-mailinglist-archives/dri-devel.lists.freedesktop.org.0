Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C7D78A7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CCA6E817;
	Tue, 15 Oct 2019 14:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1B96E822
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o28so1551974wro.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7u4hBXrlWfx7gLbjhqKfCqtuYvqxB+CwCPawtHYshf4=;
 b=T20FUTrl2rBWsk4Y4/3WQTEc/ygrzwgY/cTdfhbFhQCgbkE//AYirosymgkLj3L3JS
 T3UCFijbAibYK8yLpSzzbCLhzIiIbnXwzYSBN1Ie+dULNAAZhT0bmdgrq7MIdMjv2ZlY
 GvAD+FfSybeVQgeEetuPW7Uqe1pVEfaTD+3sLOIY6gkWydshCtpw92UQj1f5gGNg8qxL
 JnUVjTlQqa6ZQS1RvpSrIqzBEeTKvo2YGtYazdSQGLjKwMxlO905DygDx/yTsw+YZyLN
 SqdDrXOqlFJpDTVgDI8i6TtzAQ1e8hPzwJOenLD6aHODToWwdA5i7nusIY6cm3kOiNSQ
 pJKg==
X-Gm-Message-State: APjAAAXPt7Xfv5UraGC6A3NuFnyqHFdPMQJuKDMn3fNRwNwugASTN+Ap
 VNfQ4JLLzTLvqGr4pcCcDUsJFNXd
X-Google-Smtp-Source: APXvYqxD7jFzbyfAHcvSRLZEandlb19vJUykVRn8OzuKl8JgTt7NQ1g5XoBdpc6LpcrArWLVPRH/hA==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr18750874wro.256.1571150117539; 
 Tue, 15 Oct 2019 07:35:17 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c132sm31779230wme.27.2019.10.15.07.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/15] drm/dp: Remove a gratuituous blank line
Date: Tue, 15 Oct 2019 16:34:56 +0200
Message-Id: <20191015143509.1104985-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7u4hBXrlWfx7gLbjhqKfCqtuYvqxB+CwCPawtHYshf4=;
 b=eh9BU5CY2rmPllGAndbRL4bshg8avC2AI0tFpRAINq9G12Zof62HgMx4mNw8k21RDV
 R56fPivafb0BqTRXUbQSSQXY/PAka1PEI21lr09YObJ0UB2/WPGG5/pgce/4JLcNktVk
 64GPy67l/88DxWRQjZjTMvAUIW5pHYXSDfG3WJycaKvMVgHYN8ycc8xaFLbIQbVi9aa3
 fGBryLSJliJiOdJPS53ZVGicJaaf4K6UOOmiVhn5PAbh8/LWt/Gdo77fgKR5EdDJcf63
 hU551S8/S0jZPQjVWvRDoxVtX7MvMMw7qfp+Jii8AX1KrEv6PIkcrmiyiKeUqM8vp3zr
 TV0A==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkl0J3MgaWRpb21hdGlj
IHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YgYSBmdW5jdGlvbiBjYWxsIGltbWVkaWF0ZWx5
CmFmdGVyIHRoZSBmdW5jdGlvbiBjYWxsLCB3aXRob3V0IGFueSBibGFuayBsaW5lcyBpbiBiZXR3
ZWVuLCB0byBtYWtlIGl0Cm1vcmUgb2J2aW91cyB0aGF0IHRoZSB0d28gbGluZXMgYmVsb25nIHRv
Z2V0aGVyLgoKdjI6IGZpeCBvdXRkYXRlZCBjb21taXQgbWVzc2FnZSAoUGhpbGlwcCBaYWJlbCkK
ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBmMzczNzk4ZDgyZjYuLjhm
MmQ3YzQ4NTBjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0yMjAsNyArMjIwLDYgQEAg
c3RhdGljIGludCBkcm1fZHBfZHBjZF9hY2Nlc3Moc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdTgg
cmVxdWVzdCwKIAkJfQogCiAJCXJldCA9IGF1eC0+dHJhbnNmZXIoYXV4LCAmbXNnKTsKLQogCQlp
ZiAocmV0ID49IDApIHsKIAkJCW5hdGl2ZV9yZXBseSA9IG1zZy5yZXBseSAmIERQX0FVWF9OQVRJ
VkVfUkVQTFlfTUFTSzsKIAkJCWlmIChuYXRpdmVfcmVwbHkgPT0gRFBfQVVYX05BVElWRV9SRVBM
WV9BQ0spIHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
