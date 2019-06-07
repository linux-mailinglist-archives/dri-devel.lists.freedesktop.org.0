Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5038467
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579D0899DC;
	Fri,  7 Jun 2019 06:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10195899DB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:36:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 23:36:27 -0700
X-ExtLoop1: 1
Received: from pg-eswbuild-angstrom-alpha.altera.com ([10.142.34.148])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2019 23:36:25 -0700
From: "Hean-Loong, Ong" <hean.loong.ong@intel.com>
To: Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCHv16 2/3] ARM:socfpga-defconfig Intel FPGA Video and Image
 Processing Suite
Date: Fri,  7 Jun 2019 22:30:21 +0800
Message-Id: <20190607143022.427-3-hean.loong.ong@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607143022.427-1-hean.loong.ong@intel.com>
References: <20190607143022.427-1-hean.loong.ong@intel.com>
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
	dri-devel@lists.freedesktop.org, Ong@freedesktop.org,
	linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT25nIEhlYW4gTG9vbmcgPGhlYW4ubG9vbmcub25nQGludGVsLmNvbT4KCkludGVsIEZQ
R0EgVmlkZW8gYW5kIEltYWdlIFByb2Nlc3NpbmcgU3VpdGUgRnJhbWUgQnVmZmVyIElJCmRyaXZl
ciBjb25maWcgZm9yIEFycmlhIDEwIGRldmtpdCBhbmQgaXRzIHZhcmlhbnRzCgpTaWduZWQtb2Zm
LWJ5OiBPbmcsIEhlYW4gTG9vbmcgPGhlYW4ubG9vbmcub25nQGludGVsLmNvbT4KLS0tCiBhcmNo
L2FybS9jb25maWdzL3NvY2ZwZ2FfZGVmY29uZmlnIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mvc29jZnBn
YV9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL3NvY2ZwZ2FfZGVmY29uZmlnCmluZGV4IDM3
MWZjYTRlMWFiNy4uNDcyN2E5NmExNmRhIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL3Nv
Y2ZwZ2FfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc29jZnBnYV9kZWZjb25maWcK
QEAgLTExMiw2ICsxMTIsMTQgQEAgQ09ORklHX01GRF9BTFRFUkFfQTEwU1I9eQogQ09ORklHX01G
RF9TVE1QRT15CiBDT05GSUdfUkVHVUxBVE9SPXkKIENPTkZJR19SRUdVTEFUT1JfRklYRURfVk9M
VEFHRT15CitDT05GSUdfRFJNPW0KK0NPTkZJR19EUk1fSVZJUD1tCitDT05GSUdfRFJNX0lWSVBf
T0Y9bQorQ09ORklHX0ZCPXkKK0NPTkZJR19GQl9TSU1QTEU9eQorQ09ORklHX0RVTU1ZX0NPTlNP
TEU9eQorQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQorQ09ORklHX0ZSQU1FQlVGRkVSX0NP
TlNPTEVfREVURUNUX1BSSU1BUlk9eQogQ09ORklHX1VTQj15CiBDT05GSUdfVVNCX1NUT1JBR0U9
eQogQ09ORklHX1VTQl9EV0MyPXkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
