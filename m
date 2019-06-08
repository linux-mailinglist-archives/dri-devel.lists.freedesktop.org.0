Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04343A037
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 16:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC24A89257;
	Sat,  8 Jun 2019 14:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FA289257
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 14:13:01 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4326E5D;
 Sat,  8 Jun 2019 16:13:00 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: panels: Add MAINTAINERS entry for LVDS panel driver
Date: Sat,  8 Jun 2019 17:12:41 +0300
Message-Id: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560003180;
 bh=X2/JVVfXS1x08ZUXukgr/dKfXIosmPbD2c0O9DtaWNY=;
 h=From:To:Cc:Subject:Date:From;
 b=MpXZEqat3Q/YlVPEkXLNlr5/+tUHYld3Sy+Z+l/tR8Zyf04EjjNJ+TqFJgCDDTohj
 AQqRKjMnSmJUblDYJZ0FlXI321jaL/IgRgkPMABQCvHLyIH7s5ejypFWMSYmjQfG32
 3V+bKOO8rBR6/oj0kseU0P0WIEsMe0kzuiLLIqOE=
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
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgdGhlIERSTSBMVkRTIHBhbmVsIGRyaXZlciB1c2VzIGEgZGlmZmVyZW50IGFwcHJvYWNoIHRv
IERUIGJpbmRpbmdzCmNvbXBhcmVkIHRvIHdoYXQgVGhpZXJyeSBSZWRpbmcgYWR2b2NhdGVzLCBh
ZGQgYSBzcGVjaWZpYyBNQUlOVEFJTkVSUwplbnRyeSB0byBhdm9pZCBib3RoZXJpbmcgVGhpZXJy
eSB3aXRoIHJlcXVlc3RzIHJlbGF0ZWQgdG8gdGhhdCBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNv
bT4KLS0tCiBNQUlOVEFJTkVSUyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDdh
MmY0ODdlYTQ5YS4uNzEzNzMzYWZlYzE3IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtNTAyMSw2ICs1MDIxLDE0IEBAIFM6CU9ycGhhbiAvIE9ic29sZXRlCiBG
Oglkcml2ZXJzL2dwdS9kcm0vaTgxMC8KIEY6CWluY2x1ZGUvdWFwaS9kcm0vaTgxMF9kcm0uaAog
CitEUk0gRFJJVkVSIEZPUiBMVkRTIFBBTkVMUworTToJTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgorTDoJZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZworVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0KK1M6
CU1haW50YWluZWQKK0Y6CWRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKK0Y6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2ZHMu
dHh0CisKIERSTSBEUklWRVIgRk9SIE1BVFJPWCBHMjAwL0c0MDAgR1JBUEhJQ1MgQ0FSRFMKIFM6
CU9ycGhhbiAvIE9ic29sZXRlCiBGOglkcml2ZXJzL2dwdS9kcm0vbWdhLwotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
