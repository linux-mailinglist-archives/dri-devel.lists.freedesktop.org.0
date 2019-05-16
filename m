Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154820A1C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5C989152;
	Thu, 16 May 2019 14:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FF389152
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:49:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP; 16 May 2019 07:49:55 -0700
X-ExtLoop1: 1
Received: from delly.ld.intel.com (HELO [10.103.238.204]) ([10.103.238.204])
 by orsmga002.jf.intel.com with ESMTP; 16 May 2019 07:49:53 -0700
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: drm-sync timeline signaling
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <882a793c-cf49-8522-b1f3-cdb8dc685ea0@intel.com>
Date: Thu, 16 May 2019 15:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKV2hpbGUgcGlja2luZyB1cCB0aGUgSUdUIHRlc3RzIGZvciB0aW1lbGluZSBzeW5j
b2JqLApJIG5vdGljZWQgdGhhdCBhbHRob3VnaCB3ZSBkZWFsIHdpdGggbXVsdGkgd2FpdCBhY3Jv
c3MgYm90aCB0aW1lbGluZSAKKHdpdGggcG9pbnQgdmFsdWUgPiAwKSBhbmQgYmluYXJ5IChwb2lu
dCB2YWx1ZSA9IDApIHN5bmNvYmpzLAp3ZSBkb24ndCBzZWVtIHRvIGhhdmUgYSBzaW1pbGFyIGJl
aGF2aW9yIHdpdGggc2lnbmFsaW5nLgoKRG8geW91IGhhdmUgYW55IHRob3VnaHQgb24gdGhpcz8K
SSdtIGNvbnNpZGVyaW5nIHdyaXRpbmcgc29tZSBkb2NzIGJ1dCBJJ20gbm90IHF1aXRlIHN1cmUg
d2hldGhlciB0aGlzIApkaWZmZXJlbmNlIGJldHdlZW4gc2lnbmFsaW5nL3dhaXRpbmcgd2FzIGlu
dGVudGlvbmFsIG9yIGp1c3Qgb3Zlcmxvb2tlZC4KClRoYW5rcywKCi1MaW9uZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
