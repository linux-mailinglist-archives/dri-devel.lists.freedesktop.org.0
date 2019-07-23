Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A571352
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4476E1BE;
	Tue, 23 Jul 2019 07:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DF0899B7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 07:54:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 578BCADEC;
 Tue, 23 Jul 2019 07:54:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, airlied@redhat.com
Subject: [PATCH 0/3] Fixes for mgag200 cursors
Date: Tue, 23 Jul 2019 09:54:22 +0200
Message-Id: <20190723075425.24028-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.22.0
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

VGhpcyBwYXRjaCBzZXQgZml4ZXMgYSBudW1iZXIgb2YgYnVncyB0aGF0IHdoZXJlIGludHJvZHVj
ZWQgYnkgdGhlCnJlY2VudCBjaGFuZ2VzIHRvIG1nYWcyMDAncyBoYW5kbGluZyBvZiBjdXJzb3Ig
Qk9zLgoKVGhvbWFzIFppbW1lcm1hbm4gKDMpOgogIGRybS9tZ2FnMjAwOiBQaW4gZGlzcGxheWVk
IGN1cnNvciBCTyB0byB2aWRlbyBtZW1vcnkKICBkcm0vbWdhZzIwMDogU2V0IGN1cnNvciBzY2Fu
b3V0IGFkZHJlc3MgdG8gY29ycmVjdCBCTwogIGRybS9tZ2FnMjAwOiBEb24ndCB1bnBpbiB0aGUg
Y3VycmVudCBjdXJzb3IgaW1hZ2UncyBidWZmZXIuCgogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9jdXJzb3IuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
