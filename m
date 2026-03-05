Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHyNDJNOqWmz4QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:36:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24320E94A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C995899D4;
	Thu,  5 Mar 2026 09:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 09:36:16 UTC
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD36899D4;
 Thu,  5 Mar 2026 09:36:16 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay04.hostedemail.com (Postfix) with ESMTP id 6EF351A090A;
 Thu,  5 Mar 2026 09:30:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf12.hostedemail.com (Postfix) with ESMTPA id ABA5119; 
 Thu,  5 Mar 2026 09:30:41 +0000 (UTC)
Message-ID: <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
From: Joe Perches <joe@perches.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Thu, 05 Mar 2026 01:30:40 -0800
In-Reply-To: <20260305085148.7cwo3yflp7vcfldf@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: isin6ba55864u4k7cspzxagise7enff6
X-Spam-Status: No, score=-0.10
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+c/QqwBFj4RnbTOHAHP0u/fhPSDrZvfXg=
X-HE-Tag: 1772703041-391055
X-HE-Meta: U2FsdGVkX18CpOmWAsQNq/nzIGrueYMCLFpafncVkMPEeWn8lMHmxGid0nuFShmczpxd7LMIQ2HkJXitNrouaAWweblPom1aNWswKBKkaGGCen5irY0lnX3z9ty7T8amhD6qn9Q5wfYeFrX1AAy/tVHr70RJ5jxHv1CzpDKls395qE7TAifFzgOqcxBZ+LxnR/uVacI/Z8SiG+R8Q0lWc4dUv5BUq0HaFG5uC1dlHaBdlDEn65TIo3X5+7C0AcoUpQeypXp8sK9gp+VHT+vsBW/Ta2vT0Zqxi066+g9opvcn5emNN3z91009RwQ+r7ADwt/gmX2gmKTLfK9kac3enKskM+3ua1Jz
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: AF24320E94A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	URIBL_BLACK(7.50)[perches.com:mid];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[perches.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perches.com:mid]
X-Rspamd-Action: add header
X-Spam: Yes

On Thu, 2026-03-05 at 10:51 +0200, Vladimir Oltean wrote:
> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 55af015174a5..bdfa47d9c774 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
> > >  F:   drivers/phy/
> > >  F:   include/dt-bindings/phy/
> > >  F:   include/linux/phy/
> > > +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|o=
ff)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvd=
ata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|stat=
e)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)=
_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\=
.h|phy-props\.h|phy-provider\.h

You could use multiple K: entries instead of this monster.

And please use (?:<foo>) to avoid capture groups too.
