Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD2E81C8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 08:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA36F6E0BF;
	Tue, 29 Oct 2019 07:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA0B6E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 07:06:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4C81B47B;
 Tue, 29 Oct 2019 07:06:19 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	noralf@tronnes.org
Subject: [PATCH 0/2] Remove drm_fb_helper_fbdev_{setup,teardown}()
Date: Tue, 29 Oct 2019 08:06:14 +0100
Message-Id: <20191029070616.3521-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qm90aCBmdW5jdGlvbnMgYXJlIHVudXNlZC4gVXBkYXRlIFRPRE8gaXRlbSBhbmQgcmVtb3ZlIHRo
ZW0uCgpUaG9tYXMgWmltbWVybWFubiAoMik6CiAgZHJtL3RvZG86IENvbnZlcnQgZHJpdmVycyB0
byBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbgogIGRybS9mYi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJf
aGVscGVyX2ZiZGV2X3tzZXR1cCx0ZWFyZG93bn0oKQoKIERvY3VtZW50YXRpb24vZ3B1L3RvZG8u
cnN0ICAgICAgfCAgMTUgKystLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCAx
MDkgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9mYl9o
ZWxwZXIuaCAgICAgfCAgMjUgLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxNDEgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
