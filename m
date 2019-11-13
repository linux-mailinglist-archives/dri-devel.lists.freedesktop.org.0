Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C23FB471
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AD0898B6;
	Wed, 13 Nov 2019 15:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7243D898B6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:59:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1191AE07;
 Wed, 13 Nov 2019 15:58:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH 0/2] drm/ast: Remove load/unload callbacks
Date: Wed, 13 Nov 2019 16:58:55 +0100
Message-Id: <20191113155857.9507-1-tzimmermann@suse.de>
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

VGhpcyBwYXRjaHNldCByZW1vdmVzIHRoZSBsb2FkL3VubG9hZCBjYWxsYmFjayBmdW5jdGlvbnMg
ZnJvbSBhc3QuIFRlc3RlZApvbiBBU1QgMjEwMCBIVy4KClRob21hcyBaaW1tZXJtYW5uICgyKToK
ICBkcm0vYXN0OiBSZXBsYWNlIGRybV9nZXRfcGNpX2RldmljZSgpIGFuZCBkcm1fcHV0X2Rldigp
CiAgZHJtL2FzdDogQ2FsbCBzdHJ1Y3QgZHJtX2RyaXZlci57bG9hZCx1bmxvYWR9IGJlZm9yZSBy
ZWdpc3RlcmluZwogICAgZGV2aWNlCgogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgfCA0
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM3
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
