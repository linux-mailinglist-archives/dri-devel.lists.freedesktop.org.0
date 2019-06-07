Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28138463
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A26E89998;
	Fri,  7 Jun 2019 06:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964B389998
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:36:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 23:36:22 -0700
X-ExtLoop1: 1
Received: from pg-eswbuild-angstrom-alpha.altera.com ([10.142.34.148])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2019 23:36:19 -0700
From: "Hean-Loong, Ong" <hean.loong.ong@intel.com>
To: Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCHv15 0/3] Intel FPGA Video and Image Processing Suite
Date: Fri,  7 Jun 2019 22:30:19 +0800
Message-Id: <20190607143022.427-1-hean.loong.ong@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, hean.loong.ong@intel.com,
 chin.liang.see@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGVhbi1Mb29uZyBPbmcgPGhlYW4ubG9vbmcub25nQGludGVsLmNvbT4KClRoZSBGUEdB
IEZyYW1lQnVmZmVyIFNvZnQgSVAgY291bGQgYmUgc2VlbiAgYXMgdGhlIEdQVSBhbmQgdGhlIERS
TSBkcml2ZXIKcGF0Y2ggaGVyZSBpcyBhbGxvY2F0aW5nIG1lbW9yeSBmb3IgaW5mb3JtYXRpb24g
dG8gYmUgc3RyZWFtZWQgZnJvbSB0aGUKQVJNL0xpbnV4IHRvIHRoZSBkaXNwbGF5IHBvcnQuCgpC
YXNpY2FsbHkgdGhlIGRyaXZlciBqdXN0IHdyYXBzIHRoZSBpbmZvcm1hdGlvbiBzdWNoIGFzIHRo
ZSBwaXhlbHMgdG8gYmUKZHJhd24gYnkgdGhlIFNvZHQgSVAgRnJhbWVCdWZmZXIgMi4KClRoZSBw
aWVjZSBvZiBoYXJkd2FyZSBpbiBkaXNjdXNzaW9uIGlzIHRoZSBTb0MgRlBHQSB3aGVyZSBMaW51
eCBydW5zIG9uCnRoZSBBUk0gY2hpcCBhbmQgdGhlIEZHUEEgaXMgZHJpdmVuIGJ5IGl0cyBOSU9T
IHNvZnQgY29yZSB3aXRoIGl0cyBvd24KcHJvcHJpZXRhcnkgZmlybXdhcmUuCgpGb3IgZXhhbXBs
ZSB0aGUgYXBwbGljYXRpb24gZnJvbSB0aGUgQVJNIExpbnV4IHdvdWxkIGhhdmUgdG8gd3JpdGUK
aW5mb3JtYXRpb24gb24gdGhlIC9kZXYvZmIwIHdpdGggdGhlIGluZm9ybWF0aW9uIHN0b3JlZCBp
biB0aGUKU0RSQU0gdG8gYmUgZmV0Y2hlZCBieSB0aGUgRnJhbWVidWZmZXIgMiBTb2Z0IElQIGFu
ZCBkaXNwbGF5ZWQKb24gdGhlIERpc3BsYXkgUG9ydCBNb25pdG9yLgoKUmV2aWV3ZWQgYW5kIEFD
S2VkIG5lZWQgdG8gbWVyZ2UgdGhpcyBpbnRvIGRybS1taXNjCgpBY2tlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+CgpPbmcgSGVhbiBMb29uZyAoMSk6CiAgQVJNOnNvY2ZwZ2EtZGVmY29u
ZmlnIEludGVsIEZQR0EgVmlkZW8gYW5kIEltYWdlIFByb2Nlc3NpbmcgU3VpdGUKCk9uZywgSGVh
biBMb29uZyAoMik6CiAgQVJNOmR0LWJpbmRpbmdzOmRpc3BsYXkgSW50ZWwgRlBHQSBWaWRlbyBh
bmQgSW1hZ2UgUHJvY2Vzc2luZyBTdWl0ZQogIEFSTTpkcm0gaXZpcCBJbnRlbCBGUEdBIFZpZGVv
IGFuZCBJbWFnZSBQcm9jZXNzaW5nIFN1aXRlCgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYWx0cix2
aXAtZmIyLnR4dCAgICAgICAgIHwgIDYzICsrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBhcmNoL2FybS9jb25maWdzL3NvY2ZwZ2FfZGVm
Y29uZmlnICAgICAgICAgICAgfCAgIDggKwogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaXZpcC9LY29uZmlnICAgICAg
ICAgICAgICAgICAgfCAgMTQgKwogZHJpdmVycy9ncHUvZHJtL2l2aXAvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgIHwgICA2ICsKIGRyaXZlcnMvZ3B1L2RybS9pdmlwL2ludGVsX3ZpcF9jb25uLmMg
ICAgICAgICB8ICA5MyArKysrKwogZHJpdmVycy9ncHUvZHJtL2l2aXAvaW50ZWxfdmlwX2Rydi5j
ICAgICAgICAgIHwgMzM1ICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2l2aXAv
aW50ZWxfdmlwX2Rydi5oICAgICAgICAgIHwgIDczICsrKysKIDEwIGZpbGVzIGNoYW5nZWQsIDYw
NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWx0cix2aXAtZmIyLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9pdmlwL0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vaXZpcC9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9pdmlwL2ludGVsX3ZpcF9jb25uLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vaXZpcC9pbnRlbF92aXBfZHJ2LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vaXZpcC9pbnRlbF92aXBfZHJ2LmgKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
