Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6055053C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 11:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF898908E;
	Mon, 24 Jun 2019 09:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C254898AF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:08:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f17so12525362wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 02:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEu52n+Y1evOTBr/RTN/Q2dwwvERmXBMuN5/hCbfulk=;
 b=BoSCoLPteTz95c5Ex3x3ADmjxRS5OWEZ8ZjQuOwV9ynGaNGZ/OjFPCZ7ewrnYNhoZD
 UqzkO5YIsA5sMod7REOSLMg1ljVxCy7JsdCskgECrU0zZvHYvOJ1vEGkBJhX25FcFnaL
 FH3Ug/nYmBU/PgKgEt4sXSZByiI66vGlnfVmJOykHLVceJTTdIBFRl7HYvAvaR0QR+Ff
 8nnZcWFSn4Yn0wyyKlpE7GGuEGojRkaZhsUu7eo6bhtsl2YxD+0itUQk5oMEBKhQ2NPp
 cWWRGEYFrqc6lpg7pCcOrTrVi0Rdg27Yt5S4cwmZtACyk3uKQjxRU5Ht5yX8+97M4Xu3
 twbw==
X-Gm-Message-State: APjAAAVjgsSI552FpdbtRIFEVrSRd9WkdDqjJdXqaHSQNxNzraSPZMn8
 0h/+cVDLw+geUKAQGyx6tmoOkg==
X-Google-Smtp-Source: APXvYqyuOUxAk76rjGNPPMmM7yFsLswDOXGsFqw/0ITcLsTGxOqVZbjDNuuDpg6k52rVA5PxBoP+Yg==
X-Received: by 2002:a1c:c549:: with SMTP id v70mr14632320wmf.135.1561367334867; 
 Mon, 24 Jun 2019 02:08:54 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f12sm23457566wrg.5.2019.06.24.02.08.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Jun 2019 02:08:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: laurent.pinchart@ideasonboard.com,
	a.hajda@samsung.com,
	daniel@ffwll.ch
Subject: [PATCH] MAINTAINERS: Update Maintainers and Reviewers of DRM Bridge
 Drivers
Date: Mon, 24 Jun 2019 11:08:51 +0200
Message-Id: <20190624090851.17859-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEu52n+Y1evOTBr/RTN/Q2dwwvERmXBMuN5/hCbfulk=;
 b=zpj6fpMApTCm1uSb0baA4zRqXFozjA1NmbDfYrIbC5puqTTVVr4Ip4tuf78NfHLMPW
 jRHxSv33gZcEw3lNw800YMoIxvguJGQ4UccHw7fV1bcUT9+xOYaMMZttaCoiRIV1t4x0
 yw3HCSakiGKLxpgVVMCL8kICcu2Ft9ns/uNQHY5ILUWk6nBpj+HYpzvMeqG45eM8M8hp
 PRMBWFq2+GWkoMIi9vj1FTVey7LiEuKUWBf8/+wHLmVg2gXxfxtuXhSsrM7EPIwdtm67
 Mpm+6X7uiV76HxU1So8tRso+Ca3qlNxMskPITNrLemqE4Gw97mTMQpD0H/XxPHM3XisZ
 Kxwg==
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
Cc: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG15c2VsZiBhcyBjby1tYWludGFpbmVyIG9mIERSTSBCcmlkZ2UgRHJpdmVycyB0aGVuIGFk
ZCBKb25hcyBLYXJsbWFuCmFuZCBKZXJuZWogxaBrcmFiZWMgYXMgUmV2aWV3ZXJzIG9mIERSTSBC
cmlkZ2UgRHJpdmVycy4KCkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+CkNjOiBB
bmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogSmVybmVqIMWga3JhYmVjIDxq
ZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29t
PgotLS0KIE1BSU5UQUlORVJTIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDJhYmY2ZDI4
ZGI2NC4uZGQ4ZGFjYzYxZTc5IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtNTI1Myw3ICs1MjUzLDEwIEBAIFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9kcm0vZHJtLW1pc2MKIAogRFJNIERSSVZFUlMgRk9SIEJSSURHRSBDSElQUwogTToJ
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KK006CU5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KIFI6CUxhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KK1I6CUpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5z
ZT4KK1I6CUplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KIFM6CU1haW50
YWluZWQKIFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MK
IEY6CWRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
