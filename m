Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F12812CF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DDA6E942;
	Fri,  2 Oct 2020 12:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ED76E942
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:33:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 538D429CF39
Subject: Re: [PATCH v3 0/2] Add configurable handler to execute a compound
 action
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20201002123158.GA3346786@kroah.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <95030036-87fe-8c61-6fc6-c60452d8ca96@collabora.com>
Date: Fri, 2 Oct 2020 14:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002123158.GA3346786@kroah.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDAyLjEwLjIwMjAgb8KgMTQ6MzEsIEdyZWcgS3JvYWgtSGFydG1hbiBwaXN6ZToKPiBP
biBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAwMToyODoyM1BNICswMjAwLCBBbmRyemVqIFBpZXRyYXNp
ZXdpY3ogd3JvdGU6Cj4+IFRoaXMgaXMgYSBmb2xsb3ctdXAgb2YgdGhpcyB0aHJlYWQ6Cj4+Cj4+
IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWlucHV0L21zZzY4NDQ2Lmh0bWwK
PiAKPiBsb3JlLmtlcm5lbC5vcmcgaXMgZWFzaWVyIHRvIHB1bGwgc3R1ZmYgZnJvbSA6KQo+IAo+
IEFueXdheSwgd2hhdCBldmVyIGhhcHBlbmVkIHRvIHRoaXMgc2VyaWVzPyAgSXMgdGhlcmUgYSBu
ZXdlciBvbmUKPiBzb21ld2hlcmU/Cj4gCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCj4gCgpodHRw
czovL2xrbWwub3JnL2xrbWwvMjAyMC84LzE4LzQ0MAoKQW5kcnplagpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
