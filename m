Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2F147504
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7D98924F;
	Sun, 16 Jun 2019 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417618925C
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 05:54:30 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m30so3851178pff.8
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 22:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cO4Uu9l8/14KA60VnT20K6kxZTiYScPHxYXqS8cUj1Y=;
 b=tSVPCpF/yNbbCLwqzTHPelu3yr3Ik+gRvdlF8IErTmm8EM7OGX62Fi4tuujXYdeaaf
 +JNlAVRTIG1YSPEbTY3w9vtBQxQQZsKveE/MGEd0gvNUKec765hWRnr67ELCHDpdhuwu
 AI+zgIftZbuiPxcCWonoAGRSf9EeR11IqROeZjtK705vlnwdn/hYnFCNNvOTzZCM753j
 9/mngcq80jjD93kg0XyRgk9dN3iplRM1snXOoS7HNHiZ8HX7NZjnV5wcUHwkTMoNKzYO
 gq3SAgjlexCMJ08rljH65lLfEA2fFmDPLhYYdyZAJfoA8BZcxkF+wLfFIt9dDh+rrObv
 SjKg==
X-Gm-Message-State: APjAAAVDwI4tcEGipIVLQwhf3Ot2/VkafcVNmSi3tFVA1PaoNcdsePrD
 wTHtcEQllVZRm5gNpNnlAVc=
X-Google-Smtp-Source: APXvYqyE31dqao1iOV0g2rcBg/sjS3exQKNiDuAwYomijphgZtZyQlqwtwWrIEqT4Eu5e69OGoItXQ==
X-Received: by 2002:a63:e709:: with SMTP id b9mr42033753pgi.209.1560664469649; 
 Sat, 15 Jun 2019 22:54:29 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
 by smtp.gmail.com with ESMTPSA id w4sm7891097pfw.97.2019.06.15.22.54.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Jun 2019 22:54:28 -0700 (PDT)
Date: Sat, 15 Jun 2019 22:54:26 -0700
From: Shobhit Kukreti <shobhitkukreti@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
Message-ID: <20190616055425.GA6051@t-1000>
References: <20190614023225.GA27938@t-1000> <20190615173302.GB4914@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615173302.GB4914@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cO4Uu9l8/14KA60VnT20K6kxZTiYScPHxYXqS8cUj1Y=;
 b=oJy6wAILXG5XXDF7BqvaIIslFpvreRsURJ349wTXd6E8u3yzB/zsnAeP1ByNGOr/q1
 7iJxhRQ1Q3YD2MiwJzR9A3zB5ZGEbSPHoG7lcxZxJ8pksViZKqhHdSRI5saBC5jKPrn+
 biELiNd6G0h+iA9sl2l/xuKmaNK/IS4TpZYCABkxMdsah745uWxD+wDeFHsBfQd1enVe
 Wh4bwH/Xnyb7AKHVc37B4ORnULcrkPXh67xR0SVimQT1B6RQN2fH1GgOdF2HL55fL/Rt
 B7boVBkGVoMzgjZfUBlOafIfsbybmaD6rXAf2lMs8dHneV3P/EG8+kJLOunRIHk4l+xc
 1bnQ==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDc6MzM6MDJQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA3OjMyOjI4UE0gLTA3MDAsIFNo
b2JoaXQgS3VrcmV0aSB3cm90ZToKPiA+IENsZWFuZWQgdXAgY29kZSB0byByZXNvbHZlICB0aGUg
Y2hlY2twYXRjaCBlcnJvcgo+ID4gRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmVmb3JlIHRoYXQg
Y2xvc2UgcGFyZW50aGVzaXMgJyknCj4gPiBmcm9tIHRoZSBmaWxlOgo+ID4gCj4gPiBmYnRmdC9m
YnRmdC1idXMuYwo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaG9iaGl0IEt1a3JldGkgPHNob2Jo
aXRrdWtyZXRpQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9m
YnRmdC1idXMuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0
ZnQvZmJ0ZnQtYnVzLmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMKPiA+IGlu
ZGV4IDJlYTgxNGQuLjJiNDNiYzIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZmJ0
ZnQvZmJ0ZnQtYnVzLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1idXMu
Ywo+ID4gQEAgLTYyLDkgKzYyLDkgQEAgb3V0OgkJCQkJCQkJCSAgICAgIFwKPiA+ICB9ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiAgRVhQT1JUX1NZTUJPTChmdW5jKTsKPiA+ICAKPiA+IC1kZWZp
bmVfZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0X3dyaXRlX3JlZzhfYnVzOCwgdTgsIHU4LCApCj4gPiAr
ZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhmYnRmdF93cml0ZV9yZWc4X2J1czgsIHU4LCB1OCwpCj4g
PiAgZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhmYnRmdF93cml0ZV9yZWcxNl9idXM4LCBfX2JlMTYs
IHUxNiwgY3B1X3RvX2JlMTYpCj4gPiAtZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhmYnRmdF93cml0
ZV9yZWcxNl9idXMxNiwgdTE2LCB1MTYsICkKPiA+ICtkZWZpbmVfZmJ0ZnRfd3JpdGVfcmVnKGZi
dGZ0X3dyaXRlX3JlZzE2X2J1czE2LCB1MTYsIHUxNiwpCj4gCj4gV2lsbCB0aGlzIHN0aWxsIGJ1
aWxkPyAgSSB0aG91Z2h0IEkgcmVtZW1iZXIgc29tZSBvbGQgdmVyc2lvbnMgb2YgZ2NjCj4gbm90
IGxpa2luZyB0aGlzLi4uCkkgd2FzIGFibGUgdG8gYnVpbGQgaXQgd2l0aCBVYnVudHUvTGluYXJv
IEdDQy01LjQuMAo+IAo+IERpZCB5b3UgdGVzdCB0aGlzIHBhdGNoIG91dD8KSSBib290ZWQgdGhl
IGtlcm5lbCBvbiBxZW11LTIuMTIgYW5kIGluc21vZCBvZiBmYnRmdCBkcml2ZXJzIGRpZCBub3Qg
CnJldHVybiBhbnkgZXJyb3JzLiBJIGRpZCBub3QgdGVzdCBvbiBhY3R1YWwgZGlzcGxheSBoYXJk
d2FyZS4gCklmIHRoYXQgaXMgbWFuZGF0b3J5LCBJIGNhbiBkcm9wIHRoZSBwYXRjaC4gCj4gCj4g
dGhhbmtzLAo+IAo+IGdyZWcgay1oCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0aWVuY2UgYW5kIGZl
ZWRiYWNrLgoKU2hvYmhpdCBLdWtyZXRpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
