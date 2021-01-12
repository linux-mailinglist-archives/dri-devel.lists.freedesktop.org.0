Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C452F4621
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839B6E0F1;
	Wed, 13 Jan 2021 08:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1011 seconds by postgrey-1.36 at gabe;
 Tue, 12 Jan 2021 20:13:54 UTC
Received: from xanadu.blop.info (xanadu.blop.info [178.79.145.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB71289C17
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 20:13:54 +0000 (UTC)
Received: from [127.0.0.1] (helo=xanadu.blop.info)
 by xanadu.blop.info with smtp (Exim 4.89)
 (envelope-from <lucas@debian.org>)
 id 1kzPml-000202-Np; Tue, 12 Jan 2021 20:56:59 +0100
Received: (nullmailer pid 17451 invoked by uid 1000);
 Tue, 12 Jan 2021 19:56:55 -0000
Date: Tue, 12 Jan 2021 20:56:55 +0100
From: Lucas Nussbaum <lucas@debian.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH RFT 0/2] drm/vc4: Clear the display list on startup
Message-ID: <20210112195655.GA16821@xanadu.blop.info>
References: <20210112134730.810697-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112134730.810697-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 12/01/21 at 14:47 +0100, Maxime Ripard wrote:
> Hi Lucas,
> 
> Given that I'm not having a great success at reproducing the issue you
> mentioned, could you test the following patches to see if it improves things?

Unfortunately I'm missing a cable and will only get it back during the
week-end, so I cannot test before early next week. However I'm Ccing
Ryutaroh Matsumoto who could also reproduce it. Maybe he is in a better
position to test this (@Ryutaroh: I bounced the patches to you).

Lucas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
