Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB4148F06
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 21:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F0A72BA2;
	Fri, 24 Jan 2020 20:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9450572BA3;
 Fri, 24 Jan 2020 20:02:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="308217062"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 24 Jan 2020 12:02:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jan 2020 22:02:40 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915: Clear out spurious whitespace
Date: Fri, 24 Jan 2020 22:02:27 +0200
Message-Id: <20200124200231.10517-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk51
a2Ugc29tZSB3aGl0ZXNwYWNlIHRoYXQgc2hvdWxkbid0IGJlIHRoZXJlLgoKU2lnbmVkLW9mZi1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggZDZiY2U1OGIy
N2FjLi4zZGY1NzQ0MDI2YjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC0yODQyLDcgKzI4NDIsNyBAQCBk
b19pbmZlcnJlZF9tb2RlcyhzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0aW1pbmcsIHZvaWQgKmMp
CiAJY2xvc3VyZS0+bW9kZXMgKz0gZHJtX2RtdF9tb2Rlc19mb3JfcmFuZ2UoY2xvc3VyZS0+Y29u
bmVjdG9yLAogCQkJCQkJICBjbG9zdXJlLT5lZGlkLAogCQkJCQkJICB0aW1pbmcpOwotCQorCiAJ
aWYgKCF2ZXJzaW9uX2dyZWF0ZXIoY2xvc3VyZS0+ZWRpZCwgMSwgMSkpCiAJCXJldHVybjsgLyog
R1RGIG5vdCBkZWZpbmVkIHlldCAqLwogCkBAIC0zMDg0LDcgKzMwODQsNyBAQCBkb19jdnRfbW9k
ZShzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0aW1pbmcsIHZvaWQgKmMpCiAKIHN0YXRpYyBpbnQK
IGFkZF9jdnRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGVk
aWQgKmVkaWQpCi17CQorewogCXN0cnVjdCBkZXRhaWxlZF9tb2RlX2Nsb3N1cmUgY2xvc3VyZSA9
IHsKIAkJLmNvbm5lY3RvciA9IGNvbm5lY3RvciwKIAkJLmVkaWQgPSBlZGlkLApAQCAtNDM0Miw3
ICs0MzQyLDcgQEAgdm9pZCBkcm1fZWRpZF9nZXRfbW9uaXRvcl9uYW1lKHN0cnVjdCBlZGlkICpl
ZGlkLCBjaGFyICpuYW1lLCBpbnQgYnVmc2l6ZSkKIHsKIAlpbnQgbmFtZV9sZW5ndGg7CiAJY2hh
ciBidWZbMTNdOwotCQorCiAJaWYgKGJ1ZnNpemUgPD0gMCkKIAkJcmV0dXJuOwogCi0tIAoyLjI0
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
