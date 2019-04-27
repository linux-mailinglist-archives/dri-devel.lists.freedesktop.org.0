Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C37F1B242
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38688925B;
	Sat, 27 Apr 2019 01:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBC989259;
 Sat, 27 Apr 2019 01:39:36 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EA8321537;
 Sat, 27 Apr 2019 01:39:35 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 38/79] drm/amdkfd: Add picasso pci id
Date: Fri, 26 Apr 2019 21:37:57 -0400
Message-Id: <20190427013838.6596-38-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329176;
 bh=SiNG6+PoDJ3qhMYdDsp7ShNq7iRhdmgc4nm+1Yu9oLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mKiUrCt3uMTim/IDiFgAzwODNxiIXsCG//auLdPVjpkaJrrlN8xOeGbPd9QKr9r5l
 WJrvp7PuNAWMvK/ZVof0LFa2YaCHI8Fs7RJiQ9TB6nTGwCDmIUKqhVHrIGl1EDq3qT
 JhvekCm78QJuSkgRoVU5N8GVvzoM59mNwjHS43ow=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgZTdhZDg4NTUzYWExZDQ4ZTk1MGNhOWE0OTM0ZDI0NmMxYmVlNGJlNCBdCgpQaWNh
c3NvIGlzIGEgbmV3IHJhdmVuIHZhcmlhbnQuCgpSZXZpZXdlZC1ieTogS2VudCBSdXNzZWxsIDxr
ZW50LnJ1c3NlbGxAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlLmMKaW5kZXggOGJlOTY3N2MwYzA3Li5jZjlhNDlmNDlkM2EgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKQEAgLTMyMCw2ICszMjAsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBwb3J0ZWRfZGV2aWNlc1tdID0gewog
CXsgMHg5ODc2LCAmY2Fycml6b19kZXZpY2VfaW5mbyB9LAkvKiBDYXJyaXpvICovCiAJeyAweDk4
NzcsICZjYXJyaXpvX2RldmljZV9pbmZvIH0sCS8qIENhcnJpem8gKi8KIAl7IDB4MTVERCwgJnJh
dmVuX2RldmljZV9pbmZvIH0sCQkvKiBSYXZlbiAqLworCXsgMHgxNUQ4LCAmcmF2ZW5fZGV2aWNl
X2luZm8gfSwJCS8qIFJhdmVuICovCiAjZW5kaWYKIAl7IDB4NjdBMCwgJmhhd2FpaV9kZXZpY2Vf
aW5mbyB9LAkvKiBIYXdhaWkgKi8KIAl7IDB4NjdBMSwgJmhhd2FpaV9kZXZpY2VfaW5mbyB9LAkv
KiBIYXdhaWkgKi8KLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
