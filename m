Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CD435CD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 14:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BF8899A3;
	Thu, 13 Jun 2019 12:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E288999C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:18:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 05:18:21 -0700
X-ExtLoop1: 1
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.57])
 by orsmga001.jf.intel.com with ESMTP; 13 Jun 2019 05:18:19 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vkms: add crc sources list
Date: Thu, 13 Jun 2019 15:18:02 +0300
Message-Id: <20190613121802.2193-3-oleg.vasilev@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613121802.2193-1-oleg.vasilev@intel.com>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3RoZXIgZHJpdmVycyBhcmUgYWJsZSB0byBsaXN0IGNyYyBzb3VyY2VzIHdoZW4gYWNjZXNzaW5n
Ci9zeXMva2VybmVsL2RlYnVnL2RyaS8uLi4vY3J0Yy0wL2NyYy9jb250cm9sCgpFdmVuIHRob3Vn
aCBWS01TIG5vdyBzdXBwb3J0cyBvbmx5ICdhdXRvJyBtb2RlLCBpdCBpcyBtb3JlIGNvbnNpc3Rl
bnQgdG8KaGF2ZSB0aGUgbGlzdCBhdmFpbGFibGUgdG8gdGhlIHVzZXJzcGFjZS4KClNpZ25lZC1v
ZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdmttcy92a21zX2NyYy5jICB8IDkgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2NydGMuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaCAg
fCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmtt
c19jcmMuYwppbmRleCBiYzcxN2E4ODg4YjUuLjgxOTMxM2VmODBiNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92
a21zX2NyYy5jCkBAIC0yMjAsNiArMjIwLDE1IEBAIHZvaWQgdmttc19jcmNfd29ya19oYW5kbGUo
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm91dC0+
c3RhdGVfbG9jaywgZmxhZ3MpOwogfQogCitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHBpcGVf
Y3JjX3NvdXJjZXNbXSA9IHsiYXV0byJ9OworCitjb25zdCBjaGFyICpjb25zdCAqdmttc19nZXRf
Y3JjX3NvdXJjZXMoc3RydWN0IGRybV9jcnRjICpjcnRjLAorCQkJCQlzaXplX3QgKmNvdW50KQor
eworCSpjb3VudCA9IEFSUkFZX1NJWkUocGlwZV9jcmNfc291cmNlcyk7CisJcmV0dXJuIHBpcGVf
Y3JjX3NvdXJjZXM7Cit9CisKIHN0YXRpYyBpbnQgdmttc19jcmNfcGFyc2Vfc291cmNlKGNvbnN0
IGNoYXIgKnNyY19uYW1lLCBib29sICplbmFibGVkKQogewogCWludCByZXQgPSAwOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2NydGMuYwppbmRleCAxYmJlMDk5YjdkYjguLjRkMTEyOTJiYzZmMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZrbXMvdmttc19jcnRjLmMKQEAgLTE0Nyw2ICsxNDcsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9jcnRjX2Z1bmNzIHZrbXNfY3J0Y19mdW5jcyA9IHsKIAkuYXRvbWljX2Rlc3Ryb3lf
c3RhdGUgICA9IHZrbXNfYXRvbWljX2NydGNfZGVzdHJveV9zdGF0ZSwKIAkuZW5hYmxlX3ZibGFu
awkJPSB2a21zX2VuYWJsZV92YmxhbmssCiAJLmRpc2FibGVfdmJsYW5rCQk9IHZrbXNfZGlzYWJs
ZV92YmxhbmssCisJLmdldF9jcmNfc291cmNlcwk9IHZrbXNfZ2V0X2NyY19zb3VyY2VzLAogCS5z
ZXRfY3JjX3NvdXJjZQkJPSB2a21zX3NldF9jcmNfc291cmNlLAogCS52ZXJpZnlfY3JjX3NvdXJj
ZQk9IHZrbXNfdmVyaWZ5X2NyY19zb3VyY2UsCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3ZrbXMvdmttc19kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgKaW5k
ZXggODFmMWNmYmViOTM2Li44OTFmMmQ2M2Q3NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaApA
QCAtMTM2LDYgKzEzNiw4IEBAIGludCB2a21zX2dlbV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqKTsKIHZvaWQgdmttc19nZW1fdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KTsKIAogLyogQ1JDIFN1cHBvcnQgKi8KK2NvbnN0IGNoYXIgKmNvbnN0ICp2a21zX2dldF9jcmNf
c291cmNlcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCisJCQkJCXNpemVfdCAqY291bnQpOwogaW50
IHZrbXNfc2V0X2NyY19zb3VyY2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFyICpz
cmNfbmFtZSk7CiBpbnQgdmttc192ZXJpZnlfY3JjX3NvdXJjZShzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsIGNvbnN0IGNoYXIgKnNvdXJjZV9uYW1lLAogCQkJICAgc2l6ZV90ICp2YWx1ZXNfY250KTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
