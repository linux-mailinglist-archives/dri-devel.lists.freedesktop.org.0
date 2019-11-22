Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1A1077EB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 20:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71856E391;
	Fri, 22 Nov 2019 19:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68006E391;
 Fri, 22 Nov 2019 19:18:50 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id i15so3118928ybq.0;
 Fri, 22 Nov 2019 11:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IHAjOVfI8Npw2MQbT6F4zNz5zpOUSPn0XXTk4lPQpQ=;
 b=W7IfLR4X3zJJOM6VX2qm4i8vtO2/foqKnObcDdFTuqWg2BnoSNGqyQx17VDz3yoFNg
 pupnSpy/tZnwdcpTSYmwE5MSubEvV0wJSluRjDvPWVOkZWcbimJWG2UboaoDcL3K8i3z
 3EvJ2J9CwDXm7KxQmDKLs7rOWcKtgs3wmXI/x1+JC7jDhZA96TIaW6qgWqMPq1UuPeoq
 sr917ijcfDUiHgNAEAzm/jbtFP2BLZ0NRI6eb3F0hGYBj5p/76eF+GTPXWASzkv+UxhN
 lRDEMbZ0SGqwy2LEp+WuxznqKpvuKTk2KEg/jkS/c36CZWKPzm8wOYIYBSZ4vJpilvUJ
 Xv9A==
X-Gm-Message-State: APjAAAWTvNMLZP/KsyW3lnwD5V1eR3ncbrY6YyMRQqM5i/NfbZ2q+xiw
 6GhJGkTvApxVBAgsamK4LY/lnuYq
X-Google-Smtp-Source: APXvYqxsDd93Z6j0c+adJRH3kBX4YmhZUIETAtdbtAD8ryHdG+J1ylbLAaSQZN3DK5Uenc39MfI/Mg==
X-Received: by 2002:a5b:a88:: with SMTP id h8mr11890052ybq.185.1574450329809; 
 Fri, 22 Nov 2019 11:18:49 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id p83sm1933097ywc.11.2019.11.22.11.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 11:18:49 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Drop Rex Zhu for amdgpu powerplay
Date: Fri, 22 Nov 2019 14:18:41 -0500
Message-Id: <20191122191841.441550-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IHAjOVfI8Npw2MQbT6F4zNz5zpOUSPn0XXTk4lPQpQ=;
 b=j8YMIUDw0EjgzSTo2FCBm46j0T9XjLSp6PdN7c9xO8lFy9SHRjPpqR0o7D5HBSbo0U
 jQSUidr7uHzWyoJzAUDLzYKapUqLco7RmKpdO6FPi6cu6RcSbgt3gQC2hshBrfxtakft
 a3C/XOSj/mB9SgdWeVdcgW/l6P3Vjya50sSe//0oTvJTvJ+DAOMUaOwGBaEi3I+FuCI+
 vE0bB5U1S9qMMFwgQFuMxVWHXACazHvbEpSOuW9TbMRBALGXojPGl7AShaTzXPyNtqCz
 Ofbe6rHNZa/MA8e46e2UMwtgOd2cOIi1TrJPkkzoRnehfn8UPxkG6rXj74vA2yuwCxUd
 N98A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbG9uZ2VyIHdvcmtzIG9uIHRoZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxIC0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCBiNjNjMjkxYWQwMjkuLmQ1MTg1ODhiOTg3OSAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTg1Niw3ICs4NTYsNiBAQCBTOglNYWlu
dGFpbmVkCiBGOglkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFtZC1tcDIqCiAKIEFNRCBQT1dFUlBM
QVkKLU06CVJleCBaaHUgPHJleC56aHVAYW1kLmNvbT4KIE06CUV2YW4gUXVhbiA8ZXZhbi5xdWFu
QGFtZC5jb20+CiBMOglhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwogUzoJU3VwcG9ydGVk
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
