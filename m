Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E379310A38A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 18:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098DF6E184;
	Tue, 26 Nov 2019 17:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.cyber.ee (mx2.cyber.ee [193.40.6.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D4F6E184;
 Tue, 26 Nov 2019 17:46:27 +0000 (UTC)
Subject: Re: radeon UBSAN warning from user syscall
To: Alex Deucher <alexdeucher@gmail.com>
References: <70afeeda-e6a5-4c3b-2691-efe282472fa1@linux.ee>
 <CADnq5_PUgfHjvwYiYO26aTKMUAShGD5jQ=bSL+-is2Ws17BMGQ@mail.gmail.com>
From: Meelis Roos <mroos@linux.ee>
Message-ID: <34470725-7707-04d7-d5d6-5d3b6ae1aa9b@linux.ee>
Date: Tue, 26 Nov 2019 19:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CADnq5_PUgfHjvwYiYO26aTKMUAShGD5jQ=bSL+-is2Ws17BMGQ@mail.gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBMb29rcyBsaWtlIHRoZSBzaGlmdCBhbmQgbWFzayBhcmUgcmV2ZXJzZWQuICBEb2VzIHRoaXMg
cGF0Y2ggZml4IGl0PwoKWWVzLCB0aGUgd2FybmluZyBpcyBnb25lIGFuZCBpdCBzdGlsbCB3b3Jr
cy4gVGhhbmsgeW91IQoKVGVzdGVkLWJ5OiBNZWVsaXMgUm9vcyA8bXJvb3NAbGludXguZWU+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
