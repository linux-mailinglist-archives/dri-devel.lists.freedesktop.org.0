Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE9A54F3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CD689C46;
	Mon,  2 Sep 2019 11:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F0089C3F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:32:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d16so14226361wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K//Yj9ZM67KpE3ArJT4tiEAnA9GrF7zmNU5GE28h+jQ=;
 b=r2QTMjj1CcodFMA7CXne2o8x13jmenWCSa9YriDzVjS69nwZFEn/o5sSQ0LU8gcBtU
 Vw7cQdjATbWrd+QgdoLe8MQhdUBjErLyHprhIu1vPu+wfkWcTmufJeBS+SkrFviA64+H
 HRYuSx2gIGJ6KERbRl6GJG9r55pegqvNge6bA3n7Nr5/L3cnpyT3GPv+EmNL+QU6Cyez
 wFj6jvMkPuqYokZ3gcQ0u2rmxqbjzNe9gG3Vcy/2h7JFMelVao5NXxx31uzVX4DgVKvS
 tQthPhdx0QQbxi+o67a9RsPp77cK+ZDD9nEKo6W8smTCWB/zjLc3Ao78p9jSHmQ/+MqJ
 MW5g==
X-Gm-Message-State: APjAAAWq6uWPSocIZ2t8L0wQjarbZ0NHkfXFfY7Hho4qC6fExs4IweGG
 OQD1mRT6+u7FDdw4psojXnCsXe8q
X-Google-Smtp-Source: APXvYqx1xbJ0j0+SOfLXFZ8aho6pwgQK2xTr/Ad9PLny6PQjpYlqMIOoibN4rSrfVPXcs+m/qd1SUQ==
X-Received: by 2002:a1c:8187:: with SMTP id c129mr34791670wmd.32.1567423926374; 
 Mon, 02 Sep 2019 04:32:06 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id m23sm19106108wml.41.2019.09.02.04.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:32:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/21] drm/dp: Remove a gratuituous blank line
Date: Mon,  2 Sep 2019 13:31:20 +0200
Message-Id: <20190902113121.31323-21-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K//Yj9ZM67KpE3ArJT4tiEAnA9GrF7zmNU5GE28h+jQ=;
 b=n6s5/spm8kwvYBjpkIQ6v5DxjlKxcFdL08c9w7FP2zmr3V6JJBY4mDbzfG+qZKLA0n
 lM+t3thg4PdjKCOIJzd1VTaLNM728fg0E+wkEihASnMAai533SaY/3iDQogPAnP0/A+O
 ST2BMF+3f+2JmHXnEYfHpSEt17ZA3Nz3xaxy5fVzIg9MJ2OsNIdlRHS8Po0dlI9MUQiq
 MjYJWG1msUcPfaQNmkwitNWLhdd5qqq5hTDuDP4u30av9t4jIQUNhd4s5UQhzcxVRFvu
 LyJsUESakb/oTNXqSOGmrWKO2vXOG9N0LQmuMUlKJCGyBkeW3Psv/sd9GZk4956pzQV8
 t55w==
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
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCAxMzZlZTYwOWYyZWUuLjZi
NDQzMWJhZGUzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0yMTYsNyArMjE2LDYgQEAg
c3RhdGljIGludCBkcm1fZHBfZHBjZF9hY2Nlc3Moc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdTgg
cmVxdWVzdCwKIAkJfQogCiAJCXJldCA9IGF1eC0+dHJhbnNmZXIoYXV4LCAmbXNnKTsKLQogCQlp
ZiAocmV0ID49IDApIHsKIAkJCW5hdGl2ZV9yZXBseSA9IG1zZy5yZXBseSAmIERQX0FVWF9OQVRJ
VkVfUkVQTFlfTUFTSzsKIAkJCWlmIChuYXRpdmVfcmVwbHkgPT0gRFBfQVVYX05BVElWRV9SRVBM
WV9BQ0spIHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
