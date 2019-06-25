Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F4452268
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 07:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958F89F24;
	Tue, 25 Jun 2019 05:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0092.hostedemail.com
 [216.40.44.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B17689F0B;
 Tue, 25 Jun 2019 05:01:39 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 443B3C1DC84;
 Tue, 25 Jun 2019 05:01:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: sock17_81d375461e95b
X-Filterd-Recvd-Size: 2811
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 05:01:32 +0000 (UTC)
Message-ID: <3ae4c1a4a72f8ee6b75c45adfbe543fc0a7b5da1.camel@perches.com>
Subject: Re: [PATCH v4 0/7] Hexdump Enhancements
From: Joe Perches <joe@perches.com>
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
Date: Mon, 24 Jun 2019 22:01:30 -0700
In-Reply-To: <20190625031726.12173-1-alastair@au1.ibm.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>,
 Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDEzOjE3ICsxMDAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3JnPgo+IAo+IEFw
b2xvZ2llcyBmb3IgdGhlIGxhcmdlIENDIGxpc3QsIGl0J3MgYSBoZWFkcyB1cCBmb3IgdGhvc2Ug
cmVzcG9uc2libGUKPiBmb3Igc3Vic3lzdGVtcyB3aGVyZSBhIHByb3RvdHlwZSBjaGFuZ2UgaW4g
Z2VuZXJpYyBjb2RlIGNhdXNlcyBhIGNoYW5nZQo+IGluIHRob3NlIHN1YnN5c3RlbXMuCltdCj4g
VGhlIGRlZmF1bHQgYmVoYXZpb3VyIG9mIGhleGR1bXAgaXMgdW5jaGFuZ2VkLCBob3dldmVyLCB0
aGUgcHJvdG90eXBlCj4gZm9yIGhleF9kdW1wX3RvX2J1ZmZlcigpIGhhcyBjaGFuZ2VkLCBhbmQg
cHJpbnRfaGV4X2R1bXAoKSBoYXMgYmVlbgo+IHJlbmFtZWQgdG8gcHJpbnRfaGV4X2R1bXBfZXh0
KCksIHdpdGggYSB3cmFwcGVyIHJlcGxhY2luZyBpdCBmb3IKPiBjb21wYXRpYmlsaXR5IHdpdGgg
ZXhpc3RpbmcgY29kZSwgd2hpY2ggd291bGQgaGF2ZSBiZWVuIHRvbyBpbnZhc2l2ZSB0bwo+IGNo
YW5nZS4KCkkgYmVsaWV2ZSB0aGlzIGNvdmVyIGxldHRlciBpcyBtaXNsZWFkaW5nLgoKVGhlIHBv
aW50IG9mIHRoZSB3cmFwcGVyIGlzIHRvIGF2b2lkIHVubmVjZXNzYXJ5IGNoYW5nZXMKaW4gZXhp
c3RpbmcKY29kZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
