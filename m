Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ADA7625D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A83E6ECD1;
	Fri, 26 Jul 2019 09:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFFBA6E7B5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 17:12:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7893C174E;
 Thu, 25 Jul 2019 10:12:57 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 072A13F71A;
 Thu, 25 Jul 2019 10:12:55 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: fast models: Remove clcd's max-memory-bandwidth
Date: Thu, 25 Jul 2019 18:12:14 +0100
Message-Id: <20190725171215.71801-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgdW5jbGVhciB3aHkgbWF4LW1lbW9yeS1iYW5kd2lkdGggc2hvdWxkIGJlIHNldCBmb3Ig
Q0xDRCBvbiB0aGUKZmFzdCBtb2RlbC4gUmVtb3ZpbmcgdGhhdCBwcm9wZXJ0eSBhbGxvd3MgYWxs
b2NhdGluZyBhbmQgdXNpbmcgMzJicHAKYnVmZmVycywgd2hpY2ggbWF5IGJlIGRlc2lyYWJsZSBv
biBjZXJ0YWluIHBsYXRmb3JtcyBzdWNoIGFzCkFuZHJvaWQuCgpSZXBvcnRlZC1ieTogUnViZW4g
QXlyYXBldHlhbiA8cnViZW4uYXlyYXBldHlhbkBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBLZXZp
biBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+Ci0tLQoKQ2hhbmdlcyBpbiB2MjoKLSBS
ZW1vdmUgdGhlIGF0dHJpYnV0ZSBjb21wbGV0ZWx5IGluc3RlYWQgb2YgaW5jcmVhc2luZyBpdHMg
dmFsdWUuIEl0IGlzCiAgb3B0aW9uYWwgYW5kIHRoZXJlIGlzIG5vIGNsZWFyIHJlYXNvbiB3aHkg
aXQgc2hvdWxkIGJlIHNldCBhdCBhbGwuCgogYXJjaC9hcm02NC9ib290L2R0cy9hcm0vZnZwLWJh
c2UtcmV2Yy5kdHMgICAgICAgIHwgOCAtLS0tLS0tLQogYXJjaC9hcm02NC9ib290L2R0cy9hcm0v
cnRzbV92ZS1tb3RoZXJib2FyZC5kdHNpIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFzZS1y
ZXZjLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYXJtL2Z2cC1iYXNlLXJldmMuZHRzCmluZGV4
IDY4NzcwNzAyMGVjMS4uNjJhYjBkNTRmZjcxIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FybS9mdnAtYmFzZS1yZXZjLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9m
dnAtYmFzZS1yZXZjLmR0cwpAQCAtMjY1LDEzICsyNjUsNSBAQAogCQkJCTwwIDAgNDIgJmdpYyAw
IDAgR0lDX1NQSSA0MiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKIAkJCQk8MCAwIDQzICZnaWMgMCAw
IEdJQ19TUEkgNDMgSVJRX1RZUEVfTEVWRUxfSElHSD4sCiAJCQkJPDAgMCA0NCAmZ2ljIDAgMCBH
SUNfU1BJIDQ0IElSUV9UWVBFX0xFVkVMX0hJR0g+OwotCi0JCW1vdGhlcmJvYXJkIHsKLQkJCWlv
ZnBnYUAzLDAwMDAwMDAwIHsKLQkJCQljbGNkQDFmMDAwMCB7Ci0JCQkJCW1heC1tZW1vcnktYmFu
ZHdpZHRoID0gPDEzMDAwMDAwMD47IC8qIDE2YnBwIEAgNjMuNU1IeiAqLwotCQkJCX07Ci0JCQl9
OwotCQl9OwogCX07CiB9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hcm0vcnRz
bV92ZS1tb3RoZXJib2FyZC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hcm0vcnRzbV92ZS1t
b3RoZXJib2FyZC5kdHNpCmluZGV4IDQ1NGNmNmM0NGM0OS4uMDNhN2JmMDc5YzhmIDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9ydHNtX3ZlLW1vdGhlcmJvYXJkLmR0c2kKKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hcm0vcnRzbV92ZS1tb3RoZXJib2FyZC5kdHNpCkBAIC0x
ODgsOCArMTg4LDYgQEAKIAkJCQkJaW50ZXJydXB0cyA9IDwxND47CiAJCQkJCWNsb2NrcyA9IDwm
djJtX29zY2NsazE+LCA8JnYybV9jbGsyNG1oej47CiAJCQkJCWNsb2NrLW5hbWVzID0gImNsY2Rj
bGsiLCAiYXBiX3BjbGsiOwotCQkJCQkvKiA4MDB4NjAwIDE2YnBwIEAzNk1IeiB3b3JrcyBmaW5l
ICovCi0JCQkJCW1heC1tZW1vcnktYmFuZHdpZHRoID0gPDU0MDAwMDAwPjsKIAkJCQkJbWVtb3J5
LXJlZ2lvbiA9IDwmdnJhbT47CiAKIAkJCQkJcG9ydCB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
