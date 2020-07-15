Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF7220DAA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 15:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA2E6EB5A;
	Wed, 15 Jul 2020 13:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E9C6EB58;
 Wed, 15 Jul 2020 13:09:02 +0000 (UTC)
IronPort-SDR: qPtwiJSZ237Tv2pjbNVisw7dpEUrTALMA3Lv8LlaLHzdug6w7dpa4ZOq60/FepVdlKiw1CMVK6
 B2ugT37dD35g==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="233995367"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="233995367"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 06:09:01 -0700
IronPort-SDR: iuyOv+5U2Q0pnQtO+aCbqrZzFSKykM3QhqEbY+s1fvFjZ+WR6OdooY5Nbuf+qRE3AdBKHpUQPp
 5OLtHyTQKBjw==
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="460075438"
Received: from iferdane-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.55.197])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 06:08:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 15 Jul 2020 16:08:46 +0300
Message-ID: <87ft9t0vtt.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKZHJtLWludGVsLWZpeGVzLTIwMjAtMDctMTU6CmRybS9pOTE1
IGZpeGVzIGZvciB2NS44LXJjNjoKLSBGQkMgdy9hIHN0cmlkZSBmaXgKLSBGaXggdXNlLWFmdGVy
LWZyZWUgZml4IG9uIG1vZHVsZSByZWxvYWQKLSBJZ25vcmUgaXJxIGVuYWJsaW5nIG9uIHRoZSB2
aXJ0dWFsIGVuZ2luZXMgdG8gZml4IGRldmljZSBzbGVlcAotIFVzZSBHVFQgd2hlbiBzYXZpbmcv
cmVzdG9yaW5nIGVuZ2luZSBHUFIKLSBGaXggc2VsZnRlc3Qgc29ydCBmdW5jdGlvbgoKQlIsCkph
bmkuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDExYmE0Njg4NzdiYjIzZjI4
OTU2YTM1ZTg5NjM1NjI1MmQ2M2M5ODM6CgogIExpbnV4IDUuOC1yYzUgKDIwMjAtMDctMTIgMTY6
MzQ6NTAgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
Z2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRl
bC1maXhlcy0yMDIwLTA3LTE1Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOTJlMDU3
NWI5OTgzNWI1YjNhYWFiMjEzMmRkNTUxZTBlMDRlYjk2YToKCiAgZHJtL2k5MTU6IFJlY2FsY3Vs
YXRlIEZCQyB3L2Egc3RyaWRlIHdoZW4gbmVlZGVkICgyMDIwLTA3LTE0IDIwOjMxOjQ1ICswMzAw
KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuOC1yYzY6Ci0gRkJDIHcvYSBzdHJpZGUg
Zml4Ci0gRml4IHVzZS1hZnRlci1mcmVlIGZpeCBvbiBtb2R1bGUgcmVsb2FkCi0gSWdub3JlIGly
cSBlbmFibGluZyBvbiB0aGUgdmlydHVhbCBlbmdpbmVzIHRvIGZpeCBkZXZpY2Ugc2xlZXAKLSBV
c2UgR1RUIHdoZW4gc2F2aW5nL3Jlc3RvcmluZyBlbmdpbmUgR1BSCi0gRml4IHNlbGZ0ZXN0IHNv
cnQgZnVuY3Rpb24KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KQ2hyaXMgV2lsc29uICgyKToKICAgICAgZHJtL2k5MTUvZ3Q6
IElnbm9yZSBpcnEgZW5hYmxpbmcgb24gdGhlIHZpcnR1YWwgZW5naW5lcwogICAgICBkcm0vaTkx
NS9ndDogT25seSBzd2FwIHRvIGEgcmFuZG9tIHNpYmxpbmcgb25jZSB1cG9uIGNyZWF0aW9uCgpN
YWFydGVuIExhbmtob3JzdCAoMSk6CiAgICAgIGRybS9pOTE1OiBNb3ZlIGNlY19ub3RpZmllciB0
byBpbnRlbF9oZG1pX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyLCB2Mi4KClN1ZGVlcCBIb2xsYSAoMSk6
CiAgICAgIGRybS9pOTE1L3NlbGZ0ZXN0czogRml4IGNvbXBhcmUgZnVuY3Rpb25zIHByb3ZpZGVk
IGZvciBzb3J0aW5nCgpVbWVzaCBOZXJsaWdlIFJhbWFwcGEgKDEpOgogICAgICBkcm0vaTkxNS9w
ZXJmOiBVc2UgR1RUIHdoZW4gc2F2aW5nL3Jlc3RvcmluZyBlbmdpbmUgR1BSCgpWaWxsZSBTeXJq
w6Rsw6QgKDEpOgogICAgICBkcm0vaTkxNTogUmVjYWxjdWxhdGUgRkJDIHcvYSBzdHJpZGUgd2hl
biBuZWVkZWQKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jICB8IDMz
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaGRtaS5jIHwgMTAgKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfbHJjLmMgICAgICAgfCAxOSArKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3Jwcy5jICAgIHwgIDggKysrKy0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZHJ2LmggICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9wZXJmLmMgICAgICAgICAgfCAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNv
dXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
