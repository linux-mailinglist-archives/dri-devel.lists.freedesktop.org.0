Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA34603C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC2D898F1;
	Fri, 14 Jun 2019 14:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0EF898F1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:12:04 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hbmvz-00021E-3k; Fri, 14 Jun 2019 16:12:03 +0200
Message-ID: <1560521523.18257.3.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: image-convert: Enable double write reduction
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>
Date: Fri, 14 Jun 2019 16:12:03 +0200
In-Reply-To: <20190614010255.13593-1-slongerbeam@gmail.com>
References: <20190614010255.13593-1-slongerbeam@gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR FREESCALE IMX" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA2LTEzIGF0IDE4OjAyIC0wNzAwLCBTdGV2ZSBMb25nZXJiZWFtIHdyb3Rl
Ogo+IEZvciB0aGUgd3JpdGUgY2hhbm5lbHMgd2l0aCA0OjI6MCBzdWJzYW1wbGVkIFlVViBmb3Jt
YXRzLCBhdm9pZCBjaHJvbWEKPiBvdmVyZHJhdyBieSBvbmx5IHdyaXRpbmcgY2hyb21hIGZvciBl
dmVuIGxpbmVzIChza2lwIG9kZCBjaHJvbWEgcm93cykuCj4gVGhpcyByZWR1Y2VzIG5lY2Vzc2Fy
eSB3cml0ZSBtZW1vcnkgYmFuZHdpZHRoIGJ5IGF0IGxlYXN0IDI1JSAobW9yZQo+IHdpdGggcm90
YXRpb24gZW5hYmxlZCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RldmUgTG9uZ2VyYmVhbSA8c2xv
bmdlcmJlYW1AZ21haWwuY29tPgoKQXBwbGllZCBvbiBpbXgtZHJtL25leHQsIHRoYW5rcyEKCnJl
Z2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
