Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695C27F8F
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 16:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A7889BDB;
	Thu, 23 May 2019 14:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D816789BDB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 14:26:56 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53432
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hTogJ-0000BN-0A; Thu, 23 May 2019 16:26:55 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/todo: Add bootsplash entry
Date: Thu, 23 May 2019 16:26:49 +0200
Message-Id: <20190523142649.19891-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=etJBhNmi3HgpmITz+9dSKoS96PlZ1o2TnLdxAR1MwEg=; 
 b=HxXmqy0UBp0dYUCb0uaew/hmNg1vw78mGHhua0Wm+/5OUDDm94pPriHR59qFahSsZ4qf54omZKKO3f/OwbyDQ22SMgmqMKRiJGOvJiDeoWRs3YCX63/xdZDWqXhH7+eZOXa2tqiu4ztTxPLwyAMYEALsB2ZKsrehReMqVQDxSlBh0AyOPotN7m3TyIxzTLKOTxvGqJh+Fva1XdKqY7PW0jhYGDSaGr3WTU3URsjATncPPSAa1Rv3gcE3XCU/CRsOzscaMt6KoypJ4Kk31ojAZke/IgFWWAK/B/kAKcemmmu/0mgjZS9/BNd4e6jT5lvj7nTd3ALoU6bdqEcex3W7gA==;
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

RWFzZSBlbnRyeSBmb3IgYW55b25lIHdhbnRpbmcgdG8gcGljayB1cCB0aGUgYm9vdHNwbGFzaCB3
b3JrIGJ5IHByb3ZpZGluZwphIGNvdXBsZSBvZiBwb2ludGVycy4KClNpZ25lZC1vZmYtYnk6IE5v
cmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgotLS0KIERvY3VtZW50YXRpb24vZ3B1
L3RvZG8ucnN0IHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdAppbmRleCBhYjk2YmEwNjAwYTkuLjA1ZDYxMDMyMTU2NiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9n
cHUvdG9kby5yc3QKQEAgLTQ4NCw1ICs0ODQsMTkgQEAgaTkxNQogICBkZXZpY2VfbGlua19hZGQg
dG8gbW9kZWwgdGhlIGRlcGVuZGVuY3kgYmV0d2VlbiBpOTE1IGFuZCBzbmRfaGFkLiBTZWUKICAg
aHR0cHM6Ly9kcmkuZnJlZWRlc2t0b3Aub3JnL2RvY3MvZHJtL2RyaXZlci1hcGkvZGV2aWNlX2xp
bmsuaHRtbAogCitCb290c3BsYXNoCis9PT09PT09PT09CisKK1RoZXJlIGlzIHN1cHBvcnQgaW4g
cGxhY2Ugbm93IGZvciB3cml0aW5nIGludGVybmFsIERSTSBjbGllbnRzIG1ha2luZyBpdAorcG9z
c2libGUgdG8gcGljayB1cCB0aGUgYm9vdHNwbGFzaCB3b3JrIHRoYXQgd2FzIHJlamVjdGVkIGJl
Y2F1c2UgaXQgd2FzIHdyaXR0ZW4KK2ZvciBmYmRldi4KKworLSBbdjYsOC84XSBkcm0vY2xpZW50
OiBIYWNrOiBBZGQgYm9vdHNwbGFzaCBleGFtcGxlCisgIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC8zMDY1NzkvCisKKy0gW1JGQyBQQVRDSCB2MiAwMC8xM10gS2VybmVs
IGJhc2VkIGJvb3RzcGxhc2gKKyAgaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTcvMTIvMTMvNzY0
CisKKwogT3V0c2lkZSBEUk0KID09PT09PT09PT09Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
