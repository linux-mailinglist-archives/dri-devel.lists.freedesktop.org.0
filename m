Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1B327501
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 23:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD596E430;
	Sun, 28 Feb 2021 22:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846889F97
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 16:37:25 +0000 (UTC)
Received: from kamenik.kam.mff.cuni.cz (kamenik.kam.mff.cuni.cz
 [IPv6:2001:718:1e03:810::8f])
 by nikam.ms.mff.cuni.cz (Postfix) with ESMTP id D30A02805B6;
 Sun, 28 Feb 2021 17:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kam.mff.cuni.cz;
 s=gen1; t=1614530243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8CGa4uqAHGbgSuKWpiVbdnIdyuSgJntNKxif9nAs7uA=;
 b=icW8oCL9h2VY16hO9S/P7+WTdU9OW18xx0ZQ3Di2tIADhKIEvAc6ULZ+UopN7Fw4uV+sbH
 +gAOnhX1POrntDDWEIHivrqTdsqcd8gd8cQ/VixLc0C0s5SQcQHDSp5aCIw/vz0ooArJhO
 1AuxKfW8eEinQWbRLjYZt2V6hiNkb4g=
Received: by kamenik.kam.mff.cuni.cz (Postfix, from userid 3165)
 id C75602400B1; Sun, 28 Feb 2021 17:37:22 +0100 (CET)
From: =?UTF-8?q?Pavel=20Turinsk=C3=BD?= <ledoian@kam.mff.cuni.cz>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] MAINTAINERS: update drm bug reporting URL
Date: Sun, 28 Feb 2021 17:36:58 +0100
Message-Id: <20210228163658.54962-1-ledoian@kam.mff.cuni.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 28 Feb 2021 22:56:33 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Pavel=20Turinsk=C3=BD?= <ledoian@kam.mff.cuni.cz>,
 trivial@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9yaWdpbmFsIGJ1Z3ppbGxhIHNlZW1zIHRvIGJlIHJlYWQtb25seSBub3csIGxpbmtpbmcg
dG8gdGhlIGdpdGxhYgpmb3IgbmV3IGJ1Z3MuCgpTaWduZWQtb2ZmLWJ5OiBQYXZlbCBUdXJpbnNr
w70gPGxlZG9pYW5Aa2FtLm1mZi5jdW5pLmN6PgpDYzogdHJpdmlhbEBrZXJuZWwub3JnCi0tLQog
TUFJTlRBSU5FUlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGJm
YzFiODZlM2U3My4uNDM0YWRiODY5NTIyIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtNTc5Myw3ICs1NzkzLDcgQEAgTToJRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgogTToJRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgogTDoJZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwogUzoJTWFpbnRhaW5lZAotQjoJaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy8KK0I6CWh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0K
IEM6CWlyYzovL2NoYXQuZnJlZW5vZGUubmV0L2RyaS1kZXZlbAogVDoJZ2l0IGdpdDovL2Fub25n
aXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0KIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5LwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
