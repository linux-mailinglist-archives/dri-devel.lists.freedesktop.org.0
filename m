Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED5104D00
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D3F6EB67;
	Thu, 21 Nov 2019 07:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC8A6E117
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 09:57:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 01:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="218559863"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 20 Nov 2019 01:57:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 87EDB42; Wed, 20 Nov 2019 11:57:17 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 linux-fbdev@vger.kernel.org, Nishad Kamdar <nishadkamdar@gmail.com>,
 devel@driverdev.osuosl.org
Subject: [PATCH v1 2/5] fbtft: Describe function parameters in kernel-doc
Date: Wed, 20 Nov 2019 11:57:13 +0200
Message-Id: <20191120095716.26628-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2VybmVsIGRvY3VtZW50YXRpb24gc2NyaXB0IGNvbXBsYWlucyB0aGF0IHNvbWUgb2YgdGhlIGZ1
bmN0aW9uIHBhcmFtZXRlcnMKYXJlIG5vdCBkZXNjcmliZWQ6Cgpkcml2ZXJzL3N0YWdpbmcvZmJ0
ZnQvZmJ0ZnQtY29yZS5jOjU0Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAncGRhdGEnIG5vdCBkZXNjcmliZWQgaW4gJ2ZidGZ0X2ZyYW1lYnVmZmVyX2FsbG9jJwoKRGVz
Y3JpYmUgZnVuY3Rpb24gcGFyYW1ldGVycyB3aGVyZSBpdCdzIGFwcHJvcHJpYXRlLgoKU2lnbmVk
LW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2Zi
dGZ0L2ZidGZ0LWNvcmUuYyBiL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMKaW5k
ZXggNjFmMDI4NmZiMTU3Li4yMTIyYzQ0MDdiZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9mYnRmdC9mYnRmdC1jb3JlLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNv
cmUuYwpAQCAtNTI5LDYgKzUyOSw3IEBAIHN0YXRpYyB2b2lkIGZidGZ0X21lcmdlX2ZidGZ0b3Bz
KHN0cnVjdCBmYnRmdF9vcHMgKmRzdCwgc3RydWN0IGZidGZ0X29wcyAqc3JjKQogICoKICAqIEBk
aXNwbGF5OiBwb2ludGVyIHRvIHN0cnVjdHVyZSBkZXNjcmliaW5nIHRoZSBkaXNwbGF5CiAgKiBA
ZGV2OiBwb2ludGVyIHRvIHRoZSBkZXZpY2UgZm9yIHRoaXMgZmIsIHRoaXMgY2FuIGJlIE5VTEwK
KyAqIEBwZGF0YTogcGxhdGZvcm0gZGF0YSBmb3IgdGhlIGRpc3BsYXkgaW4gdXNlCiAgKgogICog
Q3JlYXRlcyBhIG5ldyBmcmFtZSBidWZmZXIgaW5mbyBzdHJ1Y3R1cmUuCiAgKgotLSAKMi4yNC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
