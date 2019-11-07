Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2FF31C3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEAF6F6BF;
	Thu,  7 Nov 2019 14:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F046F6BF;
 Thu,  7 Nov 2019 14:51:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 06:51:04 -0800
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="196575730"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.83.198])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 06:51:01 -0800
Date: Thu, 7 Nov 2019 16:50:58 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20191107145058.GA17401@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSAmIERhbmllbCwKCkEgcXVpZXQgc3RhcnQuIEhvcGVmdWxseSBzdGF5cyB0aGF0IHdh
eSA6KQoKUkNVIHRyYWNraW5nIGZpeCBhbmQgc3VzcGVuZCBHRU1fQlVHX09OIGZpeCB3aXRoIGRl
cGVuZGVuY2llcy4KClJlZ2FyZHMsIEpvb25hcwoKKioqCgpkcm0taW50ZWwtbmV4dC1maXhlcy0y
MDE5LTExLTA3OgoKT25lIFJDVSBmaXggYW5kIGZpeCBmb3Igc3VzcGVuZCBHRU1fQlVHX09OICh3
aXRoIGRlcGVuZGVuY2llcykuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDhh
ODZiMDBhNDM3ZWMwNmIyOTg0Nzc0NjNjN2E5Yjg3NzQ1NzA1MDc6CgogIE1lcmdlIHRhZyAnZHJt
LW5leHQtNS41LTIwMTktMTEtMDEnIG9mIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFn
ZDVmL2xpbnV4IGludG8gZHJtLW5leHQgKDIwMTktMTEtMDQgMTA6MjI6NTMgKzEwMDApCgphcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRlbC1uZXh0LWZpeGVzLTIwMTkt
MTEtMDcKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkOWRhY2U5NDM4OTQ1ZTdjMTNk
OTFlNjI5MjdjNWM2Yzg4YTM3ZWU1OgoKICBkcm0vaTkxNS9zZWxmdGVzdHM6IEFkZCBpbnRlbF9n
dF9zdXNwZW5kX3ByZXBhcmUgKDIwMTktMTEtMDUgMTY6MDY6MjUgKzAyMDApCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk9u
ZSBSQ1UgZml4IGFuZCBmaXggZm9yIHN1c3BlbmQgR0VNX0JVR19PTiAod2l0aCBkZXBlbmRlbmNp
ZXMpLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpDaHJpcyBXaWxzb24gKDcpOgogICAgICBkcm0vaTkxNTogUHJvdGVjdCBy
ZXF1ZXN0IHBlZWtpbmcgd2l0aCBSQ1UKICAgICAgZHJtL2k5MTUvZ3Q6IENhbGwgaW50ZWxfZ3Rf
c2FuaXRpemUoKSBkaXJlY3RseQogICAgICBkcm0vaTkxNS9nZW06IExlYXZlIHJlbG9hZGluZyBr
ZXJuZWwgY29udGV4dCBvbiByZXN1bWUgdG8gR1QKICAgICAgZHJtL2k5MTUvZ3Q6IE1vdmUgdXNl
cl9mb3JjZXdha2UgYXBwbGljYXRpb24gdG8gR1QKICAgICAgZHJtL2k5MTU6IERlZmVyIHJjNiBz
aHV0ZG93biB0byBzdXNwZW5kX2xhdGUKICAgICAgZHJtL2k5MTUvZ3Q6IERyb3AgZmFsc2UgYXNz
ZXJ0aW9uIG9uIHVzZXJfZm9yY2V3YWtlCiAgICAgIGRybS9pOTE1L3NlbGZ0ZXN0czogQWRkIGlu
dGVsX2d0X3N1c3BlbmRfcHJlcGFyZQoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9wbS5jICAgICAgICAgICB8IDYxICstLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZ3QuYyAgICAgICAgICAgICAgIHwgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L2ludGVsX2d0LmggICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9ndF9wbS5jICAgICAgICAgICAgfCA5NSArKysrKysrKysrKysrKysrKysr
KysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3BtLmggICAgICAgICAgICB8
ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9yYzYuYyAgICAgICAgICAgICAg
fCAgNSArKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfZ3RfcG0uYyAgICAgICAg
IHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgICAgICAgICAgICAgICAg
ICB8ICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oICAgICAgICAgICAgICAg
ICAgfCAgMiAtCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jICAgICAgICAgICAgICAg
ICAgfCAzNyAtLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc2NoZWR1bGVyLmMg
ICAgICAgICAgICB8ICA5ICsrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVf
Z2VtLmMgICAgICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL21vY2tf
Z2VtX2RldmljZS5jIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL21vY2tf
Z3R0LmMgICAgICAgIHwgIDMgKy0KIDE0IGZpbGVzIGNoYW5nZWQsIDExOCBpbnNlcnRpb25zKCsp
LCAxMTggZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
