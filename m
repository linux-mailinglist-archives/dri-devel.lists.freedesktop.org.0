Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62463E084F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 18:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C0D6E880;
	Tue, 22 Oct 2019 16:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7BF3B6E880;
 Tue, 22 Oct 2019 16:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 35BBB2A6046;
 Tue, 22 Oct 2019 18:09:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id sVCE-vb1yYoP; Tue, 22 Oct 2019 18:09:36 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id CC8B32A6045;
 Tue, 22 Oct 2019 18:09:35 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iMwiw-0007Va-4e; Tue, 22 Oct 2019 18:09:30 +0200
Subject: Re: radeon Disabling GPU acceleration (WB disabled?)
To: Meelis Roos <mroos@linux.ee>
References: <24b5f681-df58-7663-af7c-9fa9b9158be9@linux.ee>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <61646cbe-c4a9-cef1-d586-f3ac794b998a@daenzer.net>
Date: Tue, 22 Oct 2019 18:09:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <24b5f681-df58-7663-af7c-9fa9b9158be9@linux.ee>
Content-Language: en-CA
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMCAxMToyMSBwLm0uLCBNZWVsaXMgUm9vcyB3cm90ZToKPiBJIHRyaWVkIDUu
MiwgNS4zIGFuZCA1LjQtcmM0IG9uIG15IG9sZCBGdWppdHN1IFJYMjIwIHdpdGggaW50ZWdyYXRl
ZAo+IFJhZGVvbiBSVjEwMC4gRG1lc2cgdGVsbHMgdGhhdCBHUFUgYWNjZWxlcmF0aW9uIGlzIGRp
c2FibGVkLiBJIGRvIG5vdAo+IGtub3cgaWYgaXQgaGFzIGJlZW4gZW5hYmxlZCBpbiB0aGUgcGFz
dCAtIG5vIG9sZCBrZXJuZWxzIGhhbmR5IGF0IHRoZQo+IG1vbWVudC4KPiAKPiBGcm9tIGRtZXNn
IGl0IGxvb2tzIGxpa2Ugc29tZXRoaW5nIHdpdGggTVRSUiBtYXliZTogV0IgZGlzYWJsZWQuCgpU
aGF0J3MgaGFybWxlc3MuCgoKPiBbwqDCoMKgIDguNTM1OTc1XSBbZHJtXSBEcml2ZXIgc3VwcG9y
dHMgcHJlY2lzZSB2YmxhbmsgdGltZXN0YW1wIHF1ZXJ5Lgo+IFvCoMKgwqAgOC41MzU5ODFdIHJh
ZGVvbiAwMDAwOjAwOjA1LjA6IERpc2FibGluZyBHUFUgYWNjZWxlcmF0aW9uCgpUaGlzIGxvb2tz
IGxpa2UgZHJtX2lycV9pbnN0YWxsIHJldHVybnMgYW4gZXJyb3IgaW4gcmFkZW9uX2lycV9rbXNf
aW5pdC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
