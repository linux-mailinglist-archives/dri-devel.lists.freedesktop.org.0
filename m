Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP7fBrvCrWmU7AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 19:40:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D8231B85
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 19:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102ED10E06D;
	Sun,  8 Mar 2026 18:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com
 [216.40.44.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0157010E057;
 Sun,  8 Mar 2026 18:40:54 +0000 (UTC)
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay09.hostedemail.com (Postfix) with ESMTP id D43C38CD9E;
 Sun,  8 Mar 2026 18:40:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 6CBA920025; 
 Sun,  8 Mar 2026 18:40:45 +0000 (UTC)
Message-ID: <ca170cbaf2f8bcbc89bbda68914d8e0d7640f0e7.camel@perches.com>
Subject: Re: [PATCH v2 phy-next 24/24] MAINTAINERS: add regexes for linux-phy
From: Joe Perches <joe@perches.com>
To: vladimir.oltean@nxp.com, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Sun, 08 Mar 2026 11:40:44 -0700
In-Reply-To: <20260308114009.2546587-25-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
 <20260308114009.2546587-25-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: mibobo4wkbramau4qyjthmehkiqudojz
X-Spam-Status: No, score=-0.10
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/1oqpGv8s8V8RuGZRFC80nZh9ljOj3ohI=
X-HE-Tag: 1772995245-174125
X-HE-Meta: U2FsdGVkX1+4XRzz60ugpVFQWsQctyjPh9D8dWNkk9O80wKikqTLI//fEpSwY7VKkjTAQqCbvy/bDztttYzuNBQP3PDd6DE18CINvDdnHew5cXtwNDDJn4KiBH3EXroYIs/0V5C/aytRQmLMTGCZZlkmVqa0mog1lMlvYoTUOPxP3MIGj9+OItuBdGt7SwG+E1NN8A/Yc9Sq4U8TJPe/XcW25BuE6rH2bXBjLakvy2b4imYLaL6YRBqKlFvDSAukFbzkOlERn3vJJPcvYBJiMotKjWx2PYK5v4pDPHYsRlN9R//2k7hsjvl6B3t7ELpdAjuD6CN+C7OKO7KQLV3bHimDBNhwcxGB9M1yVBNLk9v9/I7LPCcJRUT7SR2W+eai
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
X-Rspamd-Queue-Id: E43D8231B85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_SPAM(0.00)[0.555];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[perches.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Sun, 2026-03-08 at 13:40 +0200, vladimir.oltean@nxp.com wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -10713,6 +10713,17 @@ F:	Documentation/devicetree/bindings/phy/
> +K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)

phy-props.h and phy-provider.h don't seem to exist.
Are these going to be added later?
Maybe this should be phy-common-props.h ?

Perhaps if matching only the include uses:
(/ is escaped because get_maintainer is stupid)
something like:

K:	include\s*\<linux\/phy\/phy(?:-common-props|-provider)?\.h\>
