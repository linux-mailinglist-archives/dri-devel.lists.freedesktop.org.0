Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725CECB1C2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 00:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181686EA82;
	Thu,  3 Oct 2019 22:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044556EA82;
 Thu,  3 Oct 2019 22:08:08 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iG9GW-0003Oj-5O; Thu, 03 Oct 2019 22:08:04 +0000
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
From: Colin Ian King <colin.king@canonical.com>
Autocrypt: addr=colin.king@canonical.com; prefer-encrypt=mutual; keydata=
 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
Subject: re: drm/amd/display: Add HDCP module - static analysis bug report
Message-ID: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
Date: Thu, 3 Oct 2019 23:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpTdGF0aWMgYW5hbHlzaXMgd2l0aCBDb3Zlcml0eSBoYXMgZGV0ZWN0ZWQgYSBwb3RlbnRp
YWwgaXNzdWUgd2l0aApmdW5jdGlvbiB2YWxpZGF0ZV9ia3N2IGluCmRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfZXhlY3V0aW9uLmMgd2l0aCByZWNlbnQKY29t
bWl0OgoKY29tbWl0IGVkOWQ4ZTJiY2IwMDNlYzk0NjU4Y2FmZTliMWJiMzk2MGUyMTM5ZWMKQXV0
aG9yOiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KRGF0ZTog
ICBUdWUgQXVnIDYgMTc6NTI6MDEgMjAxOSAtMDQwMAoKICAgIGRybS9hbWQvZGlzcGxheTogQWRk
IEhEQ1AgbW9kdWxlCgoKVGhlIGFuYWx5c2lzIGlzIGFzIGZvbGxvd3M6CgogMjggc3RhdGljIGlu
bGluZSBlbnVtIG1vZF9oZGNwX3N0YXR1cyB2YWxpZGF0ZV9ia3N2KHN0cnVjdCBtb2RfaGRjcCAq
aGRjcCkKIDI5IHsKCkNJRCA4OTg1MiAoIzEgb2YgMSk6IE91dC1vZi1ib3VuZHMgcmVhZCAoT1ZF
UlJVTikKCjEuIG92ZXJydW4tbG9jYWw6Ck92ZXJydW5uaW5nIGFycmF5IG9mIDUgYnl0ZXMgYXQg
Ynl0ZSBvZmZzZXQgNyBieSBkZXJlZmVyZW5jaW5nIHBvaW50ZXIKKHVpbnQ2NF90ICopaGRjcC0+
YXV0aC5tc2cuaGRjcDEuYmtzdi4KCiAzMCAgICAgICAgdWludDY0X3QgbiA9ICoodWludDY0X3Qg
KiloZGNwLT5hdXRoLm1zZy5oZGNwMS5ia3N2OwogMzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAw
OwogMzIKIDMzICAgICAgICB3aGlsZSAobikgewogMzQgICAgICAgICAgICAgICAgY291bnQrKzsK
IDM1ICAgICAgICAgICAgICAgIG4gJj0gKG4gLSAxKTsKIDM2ICAgICAgICB9CgpoZGNwLT5hdXRo
Lm1zZy5oZGNwMS5ia3N2IGlzIGFuIGFycmF5IG9mIDUgdWludDhfdCBhcyBkZWZpbmVkIGluCmRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5oIGFzIGZvbGxvd3M6
CgpzdHJ1Y3QgbW9kX2hkY3BfbWVzc2FnZV9oZGNwMSB7CiAgICAgICAgdWludDhfdCAgICAgICAg
IGFuWzhdOwogICAgICAgIHVpbnQ4X3QgICAgICAgICBha3N2WzVdOwogICAgICAgIHVpbnQ4X3Qg
ICAgICAgICBhaW5mbzsKICAgICAgICB1aW50OF90ICAgICAgICAgYmtzdls1XTsKICAgICAgICB1
aW50MTZfdCAgICAgICAgcjBwOwogICAgICAgIHVpbnQ4X3QgICAgICAgICBiY2FwczsKICAgICAg
ICB1aW50MTZfdCAgICAgICAgYnN0YXR1czsKICAgICAgICB1aW50OF90ICAgICAgICAga3N2bGlz
dFs2MzVdOwogICAgICAgIHVpbnQxNl90ICAgICAgICBrc3ZsaXN0X3NpemU7CiAgICAgICAgdWlu
dDhfdCAgICAgICAgIHZwWzIwXTsKCiAgICAgICAgdWludDE2X3QgICAgICAgIGJpbmZvX2RwOwp9
OwoKdmFyaWFibGUgbiBpcyBnb2luZyB0byBjb250YWluIHRoZSBjb250YWlucyBvZiByMHAgYW5k
IGJjYXBzLiBJJ20gbm90CnN1cmUgaWYgdGhhdCBpcyBpbnRlbnRpb25hbC4gSWYgbm90LCB0aGVu
IHRoZSBjb3VudCBpcyBnb2luZyB0byBiZQppbmNvcnJlY3QgaWYgdGhlc2UgYXJlIG5vbi16ZXJv
LgoKQ29saW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
