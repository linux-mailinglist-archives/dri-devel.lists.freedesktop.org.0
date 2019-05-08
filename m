Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77517909
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 14:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170F789686;
	Wed,  8 May 2019 12:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DAF89622
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 12:05:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 16489688-1500050 
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 13:05:51 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: Manual dma-fence signaling
Date: Wed,  8 May 2019 13:05:40 +0100
Message-Id: <20190508120542.28377-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gZml4IGEgYnVnIGluIGk5MTUsIEkgd291bGQgbGlrZSB0byBvcGVuY29kZSB0
aGUgZG1hIGZlbmNlCnNpZ25hbCBwcm9jZXNzaW5nICh0byBjbG9zZSBhIHJhY2UgY29uZGl0aW9u
IHdpdGggcHJlZW1wdGlvbiBhbmQgc2lnbmFsCmVuYWJsaW5nKS4gVHZydGtvIHF1aXRlIHJpZ2h0
bHkgb2JqZWN0ZWQgdG8gdGhlIG9wZW5jb2RpbmcgYW5kIHN1Z2dlc3RlZAp0aGF0IGRtYS1mZW5j
ZSBzaG91bGQgcHJvdmlkZSB0aGUgaGVscGVycywgc28gaGVyZSdzIG15IHN1Z2dlc3Rpb24gd3J0
CnRoZSBpbnRlcmZhY2UgdXNlZCBieSBkbWFfZmVuY2UuYyBhbmQgZGVzaXJlZCBieSBpOTE1Lmtv
Ci1DaHJpcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
