Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C296741CFF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ED48935C;
	Wed, 12 Jun 2019 06:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E048890DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:23 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOU-0003vU-ME; Tue, 11 Jun 2019 15:04:58 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 08/11] dt-bindings: display/bridge: Add bindings for ti949
Date: Tue, 11 Jun 2019 15:04:09 +0100
Message-Id: <20190611140412.32151-9-michael.drake@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611140412.32151-1-michael.drake@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk,
 David Airlie <airlied@linux.ie>, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkcyBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3I6CgogIFRJIERTOTBVQjk0OS1RMSAxMDgwcCBI
RE1JIHRvIEZQRC1MaW5rIElJSSBicmlkZ2Ugc2VyaWFsaXplcgoKSXQgc3VwcG9ydHMgaW5zdGFu
dGlhdGlvbiB2aWEgZGV2aWNlIHRyZWUgLyBBQ1BJIHRhYmxlLgoKVGhlIGRldmljZSBoYXMgdGhl
IGNvbXBhdGlibGUgc3RyaW5nICJ0aSxkczkwdWI5NDkiLCBhbmQKYW5kIGFsbG93cyBhbiBhcnJy
YXkgb2Ygc3RyaW5ncyB0byBiZSBwcm92aWRlZCBhcyByZWd1bGF0b3IKbmFtZXMgdG8gZW5hYmxl
IGZvciBvcGVyYXRpb24gb2YgdGhlIGRldmljZS4KClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRHJh
a2UgPG1pY2hhZWwuZHJha2VAY29kZXRoaW5rLmNvLnVrPgpDYzogUGF0cmljayBHbGFzZXIgPHBn
bGFzZXJAdGVzbGEuY29tPgpDYzogTmF0ZSBDYXNlIDxuY2FzZUB0ZXNsYS5jb20+Ci0tLQogLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OS50eHQgIHwgMjQgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
dGksZHM5MHViOTQ5LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwdWI5NDkudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OS50eHQKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4zYmEzODk3ZDVlODEKLS0tIC9kZXYv
bnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvdGksZHM5MHViOTQ5LnR4dApAQCAtMCwwICsxLDI0IEBACitUSSBEUzkwVUI5NDktUTEgMTA4
MHAgSERNSSB0byBGUEQtTGluayBJSUkgYnJpZGdlIHNlcmlhbGl6ZXIKKz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCitUaGlzIGlz
IHRoZSBiaW5kaW5nIGZvciBUZXhhcyBJbnN0cnVtZW50cyBEUzkwVUI5NDktUTEgYnJpZGdlIHNl
cmlhbGl6ZXIuCisKK1RoaXMgZGV2aWNlIHN1cHBvcnRzIEkyQyBvbmx5LgorCitSZXF1aXJlZCBw
cm9wZXJ0aWVzOgorCistIGNvbXBhdGlibGU6ICJ0aSxkczkwdWI5NDkiCisKK09wdGlvbmFsIHBy
b3BlcnRpZXM6CisKKy0gcmVndWxhdG9yczogTGlzdCBvZiByZWd1bGF0b3IgbmFtZSBzdHJpbmdz
IHRvIGVuYWJsZSBmb3Igb3BlcmF0aW9uIG9mIGRldmljZS4KKworRXhhbXBsZQorLS0tLS0tLQor
Cit0aTk0OTogZHM5MHViOTQ5QDAgeworCWNvbXBhdGlibGUgPSAidGksZHM5MHViOTQ5IjsKKwor
CXJlZ3VsYXRvcnM6ICJ2Y2MiLAorCSAgICAgICAgICAgICJ2Y2NfaGRtaSI7Cit9OwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
