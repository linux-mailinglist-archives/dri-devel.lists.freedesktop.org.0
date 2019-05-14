Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B233F1C66B
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 11:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEEF892BE;
	Tue, 14 May 2019 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07FB892BE;
 Tue, 14 May 2019 09:49:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 02:49:37 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.103.238.204]) ([10.103.238.204])
 by orsmga005.jf.intel.com with ESMTP; 14 May 2019 02:49:36 -0700
Subject: Re: [PATCH libdrm 1/7] addr cs chunk for syncobj timeline
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20190513095305.14110-1-david1.zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <9acb411f-a339-7ad0-8115-d1f04732eb44@intel.com>
Date: Tue, 14 May 2019 10:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513095305.14110-1-david1.zhou@amd.com>
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
Cc: Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgc21hbGwgbml0cywgcGF0Y2hlcyAyICYgNCBhcmUgOiBSZXZpZXdlZC1ieTogTGlv
bmVsIExhbmR3ZXJsaW4gCjxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KVGhlIG90aGVy
IHBhdGNoZXMgYXJlIGEgYml0IGFtZGdwdSBzcGVjaWZpYyBzbyBtYXliZSB5b3UgbWlnaHQgd2Fu
dCAKc29tZW9uZSBtb3JlIGZhbWlsaWFyIHdpdGggYW1kZ3B1IHRvIHJldmlldyB0aGVtLgpTdGls
bCBJIGRpZG4ndCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aCB0aGVtIHNvIHJlbWFpbmluZyBwYXRj
aGVzIGFyZSA6IApBY2tlZC1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJs
aW5AaW50ZWwuY29tPgoKSSdsbCBzZW5kIHRoZSBJR1Qgc3R1ZmYgc2hvcnRseS4KClRoYW5rcywK
Ci1MaW9uZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
