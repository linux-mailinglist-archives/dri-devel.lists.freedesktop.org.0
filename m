Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224C6838D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 08:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E3C89801;
	Mon, 15 Jul 2019 06:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Mon, 15 Jul 2019 06:26:29 UTC
Received: from smtp3.goneo.de (smtp3.goneo.de [85.220.129.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1161589801
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 06:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.goneo.de (Postfix) with ESMTP id C2C2623F2CD;
 Mon, 15 Jul 2019 08:17:00 +0200 (CEST)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.761
X-Spam-Level: 
X-Spam-Status: No, score=-2.761 tagged_above=-999 tests=[ALL_TRUSTED=-1,
 AWL=0.139, BAYES_00=-1.9] autolearn=ham
Received: from smtp3.goneo.de ([127.0.0.1])
 by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DTgEevx57Ss; Mon, 15 Jul 2019 08:16:59 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-091-248-140-021.ewe-ip-backbone.de
 [91.248.140.21])
 by smtp3.goneo.de (Postfix) with ESMTPSA id 7016023F001;
 Mon, 15 Jul 2019 08:16:54 +0200 (CEST)
Subject: Re: [PATCH 8/8] docs: remove extra conf.py files
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1563115732.git.mchehab+samsung@kernel.org>
 <12a160afc9e70156f671010bd4ccff9311acdc5e.1563115732.git.mchehab+samsung@kernel.org>
From: Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <e3ff0a8a-6956-3855-07be-9c126df2da2d@darmarit.de>
Date: Mon, 15 Jul 2019 08:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <12a160afc9e70156f671010bd4ccff9311acdc5e.1563115732.git.mchehab+samsung@kernel.org>
Content-Language: de-DE
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
Cc: alsa-devel@alsa-project.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Ingo Molnar <mingo@redhat.com>, linux-input@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Sean Paul <sean@poorly.run>, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF1cm8sCgpzb3JyeSwgSSBoYXZuJ3QgdGVzdGVkIHlvdXIgcGF0Y2gsIGJ1dCBvbmUgcXVl
c3Rpb24gLi4uCgpBbSAxNC4wNy4xOSB1bSAxNzoxMCBzY2hyaWViIE1hdXJvIENhcnZhbGhvIENo
ZWhhYjoKPiBOb3cgdGhhdCB0aGUgbGF0ZXhfZG9jdW1lbnRzIGFyZSBoYW5kbGVkIGF1dG9tYXRp
Y2FsbHksIHdlIGNhbgo+IHJlbW92ZSB0aG9zZSBleHRyYSBjb25mLnB5IGZpbGVzLgoKV2UgbmVl
ZCB0aGVzZSBjb25mLnB5IGFsc28gZm9yIGNvbXBpbGluZyBib29rcycgaW50byBIVE1MLiAgRm9y
IHRoaXMKdGhlIHRhZ3MuYWRkKCJzdWJwcm9qZWN0IikgaXMgbmVlZGVkLiAgU2hvdWxkIHdlIHJl
YWx5IGRyb3AgdGhpcyBmZWF0dXJlPwoKLS0gTWFya3VzIC0tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
